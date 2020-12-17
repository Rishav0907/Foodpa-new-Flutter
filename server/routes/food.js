const express=require('express');
const bodyParser=require('body-parser');
const router=express.Router()
const foodController=require('../controllers/foodControllers')

router.post("/RegisterFood",foodController.registerFood);

router.get("/foodItems",foodController.foodItems);

router.get('/foodLength',foodController.foodItemLength);

module.exports=router