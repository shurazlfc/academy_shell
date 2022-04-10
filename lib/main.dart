// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/pages/login_page.dart';
import 'package:academy_shell/pages/mainpages/MainScreen.dart';
import 'package:academy_shell/pages/new_password_afterOTP.dart';
import 'package:academy_shell/pages/onboarding_screen.dart';
import 'package:academy_shell/pages/otp_page.dart';
import 'package:academy_shell/pages/register_page.dart';
import 'package:academy_shell/pages/resetpassword_page.dart';
import 'package:academy_shell/routes/route_handler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class MyApp extends StatelessWidget {
  final bool onboardingDisplayed;
  const MyApp({Key? key, required this.onboardingDisplayed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Academy Shell",
      // // home: MainScreen(),
      initialRoute: onboardingDisplayed
          ? OnboardingScreen.routeName
          : LoginPage.routeName,
      onGenerateRoute: RouteHandler.generateRoute,
      // home: !onboardingDisplayed ? OnboardingScreen() : LoginPage(),
    );
  }
}
