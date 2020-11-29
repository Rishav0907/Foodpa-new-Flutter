import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/newPosts.dart';
import 'screens/login_screen.dart';
void main(List<String> args) {
  runApp(ClapApp());
}
class ClapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewPost(),
    );
  }
}