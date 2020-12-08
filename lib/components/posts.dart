import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:social_media/constants/constant.dart';

class Post extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  Post({this.foodName, this.foodPrice});
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
            child: Image.asset(
              'images/food.jpeg',
              height: 70,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            foodName,
            style: TextStyle(fontSize: 30),
          ),
          Text(foodPrice, style: TextStyle(fontSize: 30)),
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
