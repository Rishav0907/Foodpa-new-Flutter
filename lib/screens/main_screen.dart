import 'package:flutter/material.dart';
import 'package:social_media/components/posts.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Center(child: AppBar(
            title: Text(
              'CLAP',
              style: TextStyle(color: Colors.red, letterSpacing: 6,fontSize: 25,fontFamily: 'Lato'),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),)
        ),
        body: Post(),
        );
  }
}
