const User                      =   require('../models/Users');
const bcrypt                    =   require('bcryptjs')
const nodemailer                =   require('nodemailer');
const { validationResult }      =   require('express-validator/check')

const transporter=nodemailer.createTransport({
    host:'smtp.gmail.com',
    service:'Gmail',
    port:465,
    secure:false,
    ignoreTLS:true,
    auth:{
        type:'login',
        user:'rsaha0907@gmail.com',
        pass:'zqncimebvkundvbt'
    }
})

exports.registerUser=(req, res, next) => {
    let fullName = req.body.fullName;
    let email = req.body.email;
    let contact = req.body.contact;
    let password = req.body.password;
    let hashedPassword = bcrypt.hash(password, 16)
    const errors=validationResult(req);
    if(!errors.isEmpty)
    {
        return res.status(402).send('validation failed')
    }
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
}

exports.otp=(req,res,next)=>{
    const otpGenerator=require('otp-generator')
    let otp=otpGenerator.generate(6,{upperCase:true,specialChars:false});
    console.log(otp);
    let mailOption={
        from:'rsaha0907@gmail.com',
        to:'rishavsaha0907@gmail.com',
        subject:'Foodpa registration OTP',
        text:`Your Registration OTP is ${otp}`
    }
    transporter.sendMail(mailOption,(err,info)=>{
        if(err)
        {
            console.log(err);
        }
        else
        {
            console.log(info.response)
        }
    })
    res.json({
        otp:true
    })
    
}

exports.loginUser=(req, res, next) => {
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
}