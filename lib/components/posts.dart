import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color:Colors.red)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red)
            ),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            height: 150,
            width: double.infinity,
            child: Image.asset('images/food.jpeg',height: 70,width: double.infinity,),
            ),
        ],
      ),
    );
  }
}
