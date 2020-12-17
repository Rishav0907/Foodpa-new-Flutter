import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/newPosts.dart';
import 'screens/login_screen.dart';
import 'screens/starting_scrren.dart';
import 'screens/otp_scrren.dart';
void main(List<String> args) {
  runApp(ClapApp());
}

class ClapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OTP_screen.id,
      routes: {
        StartingScreen.id: (context) => StartingScreen(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        MainScreen.id: (context) => MainScreen(),
        NewPost.id: (context) => NewPost(),
        OTP_screen.id: (context) => OTP_screen()
      },
    );
  }
}
