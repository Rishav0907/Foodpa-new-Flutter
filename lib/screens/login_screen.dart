import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/constants/constant.dart';
import 'package:social_media/components/login_input_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'main_screen.dart';

enum FieldType {Email, Password }
const URL="http://192.168.43.61:8000/login";

class Login extends StatefulWidget {
  static String id="login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  'LOGIN',
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
            Login_InputStyle(
                inputName: 'Email',
                keyboardType: TextInputType.emailAddress,
                formIcon: FontAwesomeIcons.keyboard,
                fieldType: FieldType.Email),
            SizedBox(
              height: 20,
            ),
            Login_InputStyle(
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
                  print(email);
                  print(password);
                  setState(() {
                    showSpinner=true;
                  });
                  var response= await http.post(URL,body: {
                    'email':email,
                    'password':password
                  });
                  if(response.body=="true")
                  {
                    print(response.body);
                    setState(() {
                      showSpinner=false;
                    });
                    Navigator.pushNamed(context, MainScreen.id);
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
