// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, unnecessary_this

// import 'dart:ffi';

import 'package:academy_shell/pages/mainpages/MainScreen.dart';
import 'package:academy_shell/pages/mainpages/Academy_screen.dart';
import 'package:academy_shell/pages/register_page.dart';
import 'package:academy_shell/pages/resetpassword_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login-page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 150,
              width: 150,
              child: Image.network(
                  'http://dev-admin.academyshell.com/img/temp-logo.82162f05.jpg'),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, right: 25, left: 25),
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                        suffixIcon: emailController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                onPressed: () {
                                  emailController.clear();
                                },
                                icon: Icon(Icons.close)),
                        hintText: 'abcd@gmail.com'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                      onChanged: ((value) {
                        setState(() {
                          this.password = value;
                        });
                      }),
                      obscureText: isPasswordVisible,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_open),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ))),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MainScreen.routeName);
              },
              child: Container(
                color: Colors.blue,
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 20,
              child: Text('OR'),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ResetPasswordPage.routeName);
              },
              child: Container(
                color: Colors.blue,
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                    child: Text('Reset Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    child: Container(
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      height: 30,
                      width: 100,
                      child: Center(
                          child: Text(
                        'Register Here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onLongPress: () {
                Navigator.pushNamed(context, MainScreen.routeName);
              },
              child: Container(
                height: 100,
                width: 150,
                child: Center(
                    child: SvgPicture.asset('assets/images/fingerprint.svg')),
              ),
            )
          ],
        ),
      )),
    );
  }
}
