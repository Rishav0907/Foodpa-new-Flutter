import 'package:flutter/material.dart';
import 'package:social_media/components/OTP_input.dart';
import 'package:social_media/constants/constant.dart';

enum Otp_input {digit1 , digit2 , digit3 , digit4 , digit5 , digit6}

class OTP_screen extends StatelessWidget {
  static String id = 'otp_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'FOODPA',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Lato',
                  fontSize: 25,
                  letterSpacing: 5),
            ),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text('OTP',
                    style: TextStyle(
                        color: Colors.red, fontFamily: 'Lato', fontSize: 35)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text('We have sent an OTP to your entered email',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Lato', fontSize: 15)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: OTP_input(otpNum: Otp_input.digit1,),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: OTP_input(otpNum: Otp_input.digit2,),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: OTP_input(otpNum: Otp_input.digit3,),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: OTP_input(otpNum: Otp_input.digit4,),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: OTP_input(otpNum: Otp_input.digit5,),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: OTP_input(otpNum: Otp_input.digit6,),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: RaisedButton(
                  padding: EdgeInsets.all(14),
                  child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 25),),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){
                    var fullOtp='$otp1$otp2$otp3$otp4$otp5$otp6';
                    print(fullOtp);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
