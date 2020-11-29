import 'package:flutter/material.dart';
import 'package:social_media/screens/registration_screen.dart';
import '../constants/constant.dart';

class InputStyle extends StatelessWidget {
  final String inputName;
  final keyboardType;
  final bool textVisibility;
  final formIcon;
  final fieldType;
  InputStyle({@required this.inputName,this.keyboardType,this.textVisibility=false,this.formIcon,this.fieldType});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        onChanged: (value){
          if(fieldType==FieldType.Name)
          {
            name=value;
            print(name);
          }
          else if(fieldType==FieldType.Email)
          {
            email=value;
            print(email);
          }
          else if(fieldType==FieldType.Contact)
          {
            contact=value;
            print(contact);
          }
          else
          {
            password=value;
            print(password);
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
