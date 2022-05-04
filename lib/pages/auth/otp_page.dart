// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:academy_shell/widgets/app_text.dart';
import 'package:academy_shell/pages/auth/new_password_afterOTP.dart';
import 'package:academy_shell/widgets/app_large_Text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';

class OtpPage extends StatefulWidget {
  static const String routeName = "/otp-page";
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int timeleft = 60;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeleft > 0) {
        setState(() {
          timeleft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  Widget buildPinPut() {
    return Pinput(
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 8, 86, 150)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onCompleted: (pin) => print(pin),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          child: Center(
              child: AppLargeText(
            text: 'Verification Code',
          )),
        ),
        Container(
          padding: EdgeInsets.all(20),
          // height: MediaQuery.of(context).size.height - 50,
          // width: MediaQuery.of(context).size.width - 20,
          child: AppText(
              text: 'Please type the verification code sent to your number'),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 80,
          width: 250,
          // color: Color.fromARGB(255, 15, 3, 139),
          child: buildPinPut(),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          width: 250,
          child: Center(child: Text('OTP Autosent in $timeleft seconds')),
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewPassword()));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Verify Me',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
      ]),

      // body: buildPinPut(),
    );
  }
}
