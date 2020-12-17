import 'package:flutter/material.dart';
import 'package:social_media/screens/otp_scrren.dart';
import 'package:social_media/constants/constant.dart';

class OTP_input extends StatelessWidget {
  final otpNum;
  OTP_input({@required this.otpNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 40,
      child: TextField(
        maxLength: 1,
        cursorHeight: 20,
        onChanged: (value) {
          if (otpNum == Otp_input.digit1) {
            otp1 = value;
          } else if (otpNum == Otp_input.digit2) {
            otp2 = value;
          } else if (otpNum == Otp_input.digit3) {
            otp3 = value;
          } else if (otpNum == Otp_input.digit4) {
            otp4 = value;
          } else if (otpNum == Otp_input.digit5) {
            otp5 = value;
          } else{
            otp6 = value;
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
