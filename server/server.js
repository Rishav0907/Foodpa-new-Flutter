const express = require('express')
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const User = require('./models/Users');
const bcrypt = require('bcryptjs')
const Food = require('./models/Food');
const {body,validationResult}=require('express-validator')
const app = express();
app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.get('/', (req, res) => {
    console.log('requested')
    res.send('<h1>hello</h1>')
})
app.post('/register',[
    body('fullName').isLength({min:5}).exists(),
    body('email').isEmail().exists(),
    body('contact').isMobilePhone().exists(),
    body('password').isLength({min:5}).exists()
] ,(req, res, next) => {
    let fullName = req.body.fullName;
    let email = req.body.email;
    let contact = req.body.contact;
    let password = req.body.password;
    let hashedPassword = bcrypt.hash(password, 16)
    console.log(fullName);
    console.log(email);
    console.log(contact)
    console.log(password)
    User.findOne({
        email: email
    }).then(user => {
        if (!user) {
            console.log('creating user')
        }
        hashedPassword = bcrypt.hash(password, 16);
        return hashedPassword
    }).then(hashedPassword => {
        const user = new User({
            name: fullName,
            email: email,
            contact: contact,
            password: hashedPassword
        })
        user.save();
    }).then(user => {
        res.send("true")
    }).catch(err => console.log(err))
})
app.post("/login", (req, res, next) => {
    let email = req.body.email;
    let password = req.body.password;
    let hashedPassword = bcrypt.hash(password, 16)
    console.log(email)
    console.log(password)
    User.findOne({
        email: email,
    })
        .then(user => {
            console.log("User exists")
            return bcrypt.compare(password, user.password)
        })
        .then(match => {
            if (match) {
                console.log("Logged in")
                res.send("true")
            }
        })
        .catch(err => console.log(err))
})

app.post("/RegisterFood", (req, res, next) => {
    let foodName = req.body.foodName;
    let foodPrice = req.body.foodPrice;
    let foodImage = req.body.foodImage;
    const foodItem = new Food({
        foodName: foodName,
        foodPrice: foodPrice,
        foodImage: foodImage
    })
    foodItem.save();
    console.log("Food Saved")
    res.send("true")
})

app.get("/foodItems", (req, res, next) => {
    Food.find()
        .then(foodItem => {
            console.log(foodItem)
            res.json(foodItem)
        })
})

mongoose.connect("mongodb://localhost:27017/foodpa", { useNewUrlParser: true })
    .then(result => {
        app.listen(8000, () => {
            console.log("Server started")
        })
    })
    .catch(err => console.log(err));