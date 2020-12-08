import 'package:flutter/material.dart';
import 'package:social_media/screens/login_screen.dart';
import 'package:social_media/screens/registration_screen.dart';

class StartingScreen extends StatelessWidget {
  static String id = "starting_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FOODPA',
                style: TextStyle(color: Colors.red, fontSize: 60),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  child: Text('LOGIN',
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 4, fontSize: 25)),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Registration.id);
                  },
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 4, fontSize: 25),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
