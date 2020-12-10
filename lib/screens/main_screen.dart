import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_media/components/posts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media/screens/newPosts.dart';
import 'package:social_media/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const URL = 'http://192.168.43.61:8000/foodItems';

class MainScreen extends StatefulWidget {
  static String id = "main_screen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var showSpinner = true;
  @override
  void initState() {
    super.initState();
    getFoodData();
  }

  void getFoodData() async {
    http.Response response = await http.get(URL);
    foodData = jsonDecode(response.body);
    setState(() {
      showSpinner = false;
    });
    print(foodData);
    for (var i = 0; i < 2; i++) {
      print(foodData[i]['foodName']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Center(
              child: AppBar(
                title: Text(
                  'FOODPA',
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
        body: Container(
          child: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: ListView(
                children: [
                  if (showSpinner == false)
                    for (var i = 2; i > 0; i--)
                      Post(
                        foodName: foodData[i - 1]['foodName'],
                        foodPrice: foodData[i - 1]['foodPrice'],
                        foodImage: foodData[i-1]['foodImage']
                      )
                ],
              )),
        ),
        // );
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
        ));
  }
}
