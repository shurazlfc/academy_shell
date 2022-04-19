// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/pages/academy_management_pages/academy_users.dart';
import 'package:academy_shell/pages/intropages/login_page.dart';
import 'package:academy_shell/pages/bottomnavigationpages/MainScreen.dart';
import 'package:academy_shell/pages/intropages/new_password_afterOTP.dart';
import 'package:academy_shell/pages/intropages/onboarding_screen.dart';
import 'package:academy_shell/pages/intropages/otp_page.dart';
import 'package:academy_shell/pages/intropages/register_page.dart';
import 'package:academy_shell/pages/intropages/resetpassword_page.dart';

import 'package:academy_shell/routes/route_handler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

String finalEmail = '';
String finalPassword = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.removeAfter(initialization);
  // await initialization();
  final prefs = await SharedPreferences.getInstance();
  bool onboardingDisplayed =
      prefs.getBool(AppConstants.onBoardingDisplayed) ?? false;
  runApp(MyApp(
    onboardingDisplayed: onboardingDisplayed,
  ));
}

Future initialization() async {
  await Future.delayed(Duration(milliseconds: 2));
}

class MyApp extends StatefulWidget {
  final bool onboardingDisplayed;
  final accesstoken;

  const MyApp({Key? key, required this.onboardingDisplayed, this.accesstoken})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData();
  }

  getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var ObtainedEmail = sharedPreferences.getString('email') ?? "";
    var ObtainedPassword = sharedPreferences.getString('password') ?? "";
    setState(() {
      finalEmail = ObtainedEmail;
      finalPassword = ObtainedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      title: "Academy Shell",
      // theme: ThemeData.dark(),
      // home: TestingApi(),
      // initialRoute: onboardingDisplayed
      //     ? OnboardingScreen.routeName
      //     : LoginPage.routeName,
      onGenerateRoute: RouteHandler.generateRoute,
      home: !widget.onboardingDisplayed
          ? OnboardingScreen()
          : (finalEmail.isNotEmpty && finalPassword.isNotEmpty)
              ? MainScreen()
              : LoginPage(),
    );
  }
}
