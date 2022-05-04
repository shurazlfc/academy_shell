// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/pages/auth/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordPage extends StatelessWidget {
  //  static const String routeName = "/login-page";

  static const String routeName = "/ResetPassword-page";
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Reset Password',
          style: TextStyle(color: Colors.white),
        )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/secure.svg',
                  height: 200, width: 150),
              SizedBox(
                height: 10,
              ),
              TextField(
                  //
                  // obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
                prefixIcon: Icon(Icons.mail),
              )),
              SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  // obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone Number',
                    prefixIcon: Icon(Icons.phone),
                  )),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, OtpPage.routeName);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Center(
                      child: Text(
                    'Send  OTP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //35 samosa 3 jerry !! //
}
