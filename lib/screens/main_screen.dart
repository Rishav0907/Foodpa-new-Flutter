import 'package:flutter/material.dart';
import 'package:social_media/components/posts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media/screens/newPosts.dart';

class MainScreen extends StatelessWidget {
  static String id="main_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Center(
            child: AppBar(
              title: Text(
                'CLAP',
                style: TextStyle(
                    color: Colors.red,
                    letterSpacing: 6,
                    fontSize: 25,
                    fontFamily: 'Lato'),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
          )),
      body: ListView(
        children: [
          Post(),
          Post(),
          Post(),
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        
        child: FittedBox(
          child: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamed(context, NewPost.id);
        },
        icon: Icon(FontAwesomeIcons.plus),
        label: Text('New Post'),
      ),
        ),
      )
    );
  }
}
