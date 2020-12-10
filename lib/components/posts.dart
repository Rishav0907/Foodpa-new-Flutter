import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:social_media/constants/constant.dart';

var img64;

class Post extends StatefulWidget {
  final String foodName;
  final String foodPrice;
  final String foodImage;
  Post(
      {@required this.foodName,
      @required this.foodPrice,
      @required this.foodImage});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  var img64;
  @override
  void initState()
  {
    super.initState();
    img64=base64Decode(widget.foodImage);
    print(img64);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.red)
            // ),
            margin: EdgeInsets.all(20),
            // padding: EdgeInsets.all(15),
            height: 200,
            width: double.infinity,
            child: Image.memory(
              img64,
              height: 70,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.foodName,
            style: TextStyle(fontSize: 30),
          ),
          Text(widget.foodPrice, style: TextStyle(fontSize: 30)),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () {
                print("Liked");
              },
              child: Text(
                'LIKE',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.red,
            ),
          ),
          Container(
            color: Colors.grey[600],
            child: SizedBox(
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
