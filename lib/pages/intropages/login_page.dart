// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, unnecessary_this

// import 'dart:ffi';

import 'package:academy_shell/pages/bottomnavigationpages/MainScreen.dart';
import 'package:academy_shell/pages/bottomnavigationpages/Academy_screen.dart';
import 'package:academy_shell/pages/intropages/register_page.dart';
import 'package:academy_shell/pages/intropages/resetpassword_page.dart';
import 'package:academy_shell/services/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login-page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  // @override
  // void initState() {
  //   super.initState();
  //   emailController.addListener(() {
  //     setState(() {});
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    fetchEmailAndPassword();
    super.initState();
  }

  fetchEmailAndPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _emailController.text = pref.getString("email") ?? "";
    // _passwordController.text = pref.getString("password") ?? "";
    setState(() {});
  }

  validateAndSave() async {
    if (_formKey.currentState!.validate()) {
      var login = await Login()
          .fetchlogin(_emailController.text, _passwordController.text, context);
      if (login != null) {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token", login.token ?? "");
        Navigator.pushNamed(context, MainScreen.routeName);
      }
    } else {
      SnackBar(
        content: Text('invalid credentials000'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: SafeArea(
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
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextFormField(
                        validator: (value) {
                          value = _emailController.text;
                          if (value.isEmpty) {
                            return "username required";
                          } else {
                            return null;
                          }
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                            suffixIcon: _emailController.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      _emailController.clear();
                                    },
                                    icon: Icon(Icons.close)),
                            hintText: 'abcd@gmail.com'),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: isPasswordVisible,
                          validator: (value) {
                            value = _passwordController.text;
                            if (value.isEmpty) {
                              return "password required";
                            }
                            return null;
                          },
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
              ),
              InkWell(
                onTap: () async {
                  validateAndSave();
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString('email', _emailController.text);
                  sharedPreferences.setString(
                      'password', _passwordController.text);
                  // await Navigator.pushNamed(context, MainScreen.routeName);
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
      ),
    );
  }
}
