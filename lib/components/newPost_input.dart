import 'package:flutter/material.dart';
import 'package:social_media/constants/constant.dart';
class NewPostInput extends StatelessWidget{
  String inputName;
  TextInputType keyboardType;
  NewPostInput({@required this.inputName,@required this.keyboardType});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: TextField(
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: kTextField.copyWith(hintText: inputName),
        onChanged: (value){
          if(inputName=='Food Name'){
            foodName=value;
          }
          else{
            foodPrice=value;
          }
        },
      ),
    );
  }
}
