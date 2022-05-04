// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:academy_shell/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  static const String routeName = '/newpassword';
  // static const String routeName = "/login-page";
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String password = '';
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Your Password'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
                onChanged: ((value) {
                  setState(() {
                    this.password = value;
                  });
                }),
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add New Password',
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
                    labelText: 'Confirm New Password',
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
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.routeName);
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
                    'Done',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
