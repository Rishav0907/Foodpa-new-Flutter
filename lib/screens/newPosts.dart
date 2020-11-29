import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/components/newPost_input.dart';
import 'dart:convert';

import 'package:social_media/constants/constant.dart';
const URL="http://192.168.43.61:8000/RegisterFood";
String baseImage;
class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  
  Future choosePhoto() async{
    var pickedImage=await ImagePicker().getImage(source: ImageSource.gallery);
    final bytes=await pickedImage.readAsBytes();
    baseImage=base64Encode(bytes);
    print(baseImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 15,
          backgroundColor: Colors.white,
          title: Text(
            'FOODPA',
            style: TextStyle(
                color: Colors.red,
                letterSpacing: 5,
                fontSize: 30,
                fontFamily: 'Lato'),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'New Post',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Lato',
                  letterSpacing: 5,
                  fontSize: 50),
            ),
            SizedBox(
              height: 50,
            ),
            NewPostInput(
              inputName: "Food Name",
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 30,
            ),
            NewPostInput(
              inputName: "Food Price",
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                onPressed: (){
                  choosePhoto();
                },
                textColor: Colors.white,
              padding: EdgeInsets.all(20),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                
              ),
              child: Text('CHOOSE PHOTO'),
            ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          child: FlatButton(
            onPressed: () async{
              http.Response response= await http.post(URL,body: {
                'foodName':foodName,
                'foodPrice':foodPrice,
                'foodImage':baseImage
              });
              print(response.body);
            },
            height: 70,
          child: Text(
            'POST',
            style:
                TextStyle(
                  color: Colors.white, 
                  letterSpacing: 4, 
                  fontSize: 35,
                  fontFamily: 'Lato'
                  ),
          ),
        ),
        )
      ),
    );
  }
}
