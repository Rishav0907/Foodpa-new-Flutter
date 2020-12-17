const Food = require('../models/Food');
var foodLength;

exports.registerFood=(req, res, next) => {
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
}

exports.foodItems=(req, res, next) => {
    Food.find()
        .then(foodItem => {
            console.log(foodItem)
            res.json(foodItem)
        })
}

exports.foodItemLength=(req,res,next) =>{
    Food.find()
    .then(foodItem => {
        foodLength=foodItem.length;
        console.log(foodLength);
        res.json([{
            foodItemLength:foodLength
        }])
    })
}