// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, unnecessary_this

// import 'dart:ffi';

// import 'package:academy_shell/pages/auth/bloc/auth_bloc.dart';
import 'package:academy_shell/pages/intropages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  // static const String routeName = "/login-page";

  static const String routeName = "/register-page";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
  }

  clearController() {
    emailController.clear();
    nameController.clear();
  }
  // GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Create Account')),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 45, right: 25, left: 25),
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                              prefixIcon: Icon(Icons.person),
                              suffixIcon: nameController.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        nameController.clear();
                                      },
                                      icon: Icon(Icons.close)),
                              hintText: 'Enter your Full Name'),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 40),
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
                          keyboardType: TextInputType.text,
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(7),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffix: IconButton(
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                            keyboardType: TextInputType.number,
                            // obscureText: isPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your phone Number',
                              prefixIcon: Icon(Icons.phone),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 45, right: 25, left: 25),
                    child: InkWell(
                      onTap: () {
                        // BlocProvider.of<AuthBloc>(context).add(
                        //     RegistrationEvent(
                        //         password: password,
                        //         username: emailController.text));
                        // Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Container(
                        color: Colors.blue,
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        child: Center(
                            child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
