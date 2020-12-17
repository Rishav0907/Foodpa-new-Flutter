const express           =   require('express');
const bodyParser        =   require('body-parser');
const router            =   express.Router()
const userController    =   require('../controllers/userControllers');
const { check }         =   require('express-validator/check')

router.post('/register',
    check('fullName').exists(),
    check('email').isEmail(),
    check('contact').isMobilePhone(),
    check('password').isLength({min:6}).isAlphanumeric(),
    userController.registerUser);

router.get('/otp',userController.otp);

router.post("/login",userController.loginUser);

module.exports=router