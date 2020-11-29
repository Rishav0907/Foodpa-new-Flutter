const mongoose=require('mongoose');
const Schema=mongoose.Schema;
const FoodSchema=new Schema({
    foodName:{
        type:String,
        required:true
    },
    foodPrice:{
        type:String,
        required:true
    },
    foodImage:{
        type:String,
        required:true
    }
})
module.exports=mongoose.model('Food',FoodSchema);