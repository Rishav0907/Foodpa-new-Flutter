import 'package:flutter/material.dart';
import 'package:social_media/screens/login_screen.dart';
import '../constants/constant.dart';

class Login_InputStyle extends StatelessWidget {
  final String inputName;
  final keyboardType;
  final bool textVisibility;
  final formIcon;
  final fieldType;
  Login_InputStyle({@required this.inputName,this.keyboardType,this.textVisibility=false,this.formIcon,this.fieldType});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        onChanged: (value){
          if(fieldType==FieldType.Email)
          {
            email=value;
          }
          else
          {
            password=value;
          }
        },
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: kTextField.copyWith(labelText: inputName,prefixIcon: Icon(formIcon)),
        obscureText: textVisibility,
      ),
    );
  }
}
