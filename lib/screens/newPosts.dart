import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/components/newPost_input.dart';
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_media/constants/constant.dart';
import 'package:social_media/screens/main_screen.dart';
const URL="https://foodpa-app.herokuapp.com/RegisterFood";
String baseImage;
class NewPost extends StatefulWidget {
  static String id="new_post";
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  var showSpinner=false;
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
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          child: FlatButton(
            onPressed: () async{
              setState(() {
                showSpinner=true;
              });
              http.Response response= await http.post(URL,body: {
                'foodName':foodName,
                'foodPrice':foodPrice,
                'foodImage':baseImage
              });
              print(response.body);
              if(response.body=='true')
              {
                setState(() {
                  showSpinner=false;
                });
                Navigator.pushNamed(context, MainScreen.id);
              }
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
