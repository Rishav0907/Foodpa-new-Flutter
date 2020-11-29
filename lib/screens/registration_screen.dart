import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/constants/constant.dart';
import 'package:social_media/components/input_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

enum FieldType { Name, Email, Contact, Password }
const URL="http://192.168.43.61:8000/register";

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  'FOODPA',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 60,
                      letterSpacing: 5,
                      fontFamily: 'Lato'),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Center(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      letterSpacing: 5,
                      fontFamily: 'Lato'),
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            InputStyle(
              inputName: 'Full Name',
              keyboardType: TextInputType.name,
              formIcon: FontAwesomeIcons.user,
              fieldType: FieldType.Name,
            ),
            SizedBox(
              height: 20,
            ),
            InputStyle(
                inputName: 'Email',
                keyboardType: TextInputType.emailAddress,
                formIcon: FontAwesomeIcons.keyboard,
                fieldType: FieldType.Email),
            SizedBox(
              height: 20,
            ),
            InputStyle(
              inputName: 'Contact no',
              keyboardType: TextInputType.number,
              formIcon: FontAwesomeIcons.phone,
              fieldType: FieldType.Contact,
            ),
            SizedBox(
              height: 20,
            ),
            InputStyle(
              inputName: 'Password',
              keyboardType: TextInputType.visiblePassword,
              textVisibility: true,
              formIcon: FontAwesomeIcons.lock,
              fieldType: FieldType.Password,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () async{
                  setState(() {
                    showSpinner=true;
                  });
                  var respone = await http.post(URL,body: {
                    'fullName':name,
                    'email':email,
                    'contact':contact,
                    'password':password
                  });
                  print(respone.body);
                  if(respone.body=='true')
                  {
                    setState(() {
                      showSpinner=false;
                    });
                  }
                },
                elevation: 15,
                textColor: Colors.white,
                color: Colors.red,
                child: Center(
                  child: Row(
                  children: [
                    Text('CREATE ACCOUNT'),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(FontAwesomeIcons.arrowCircleRight)
                  ],
                ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
          )
        )
      ),
    );
  }
}
