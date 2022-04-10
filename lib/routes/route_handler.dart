// import 'dart:js';

import 'package:academy_shell/pages/login_page.dart';
import 'package:academy_shell/pages/mainpages/MainScreen.dart';
import 'package:academy_shell/pages/new_password_afterOTP.dart';
import 'package:academy_shell/pages/onboarding_screen.dart';
import 'package:academy_shell/pages/otp_page.dart';
import 'package:academy_shell/pages/register_page.dart';
import 'package:academy_shell/pages/resetpassword_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterPage.routeName:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case ResetPasswordPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordPage());

      case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context) => const MainScreen());

      case OtpPage.routeName:
        return MaterialPageRoute(builder: ((context) => const OtpPage()));

      case NewPassword.routeName:
        return MaterialPageRoute(builder: ((context) => const NewPassword()));
      default:
        return MaterialPageRoute(builder: (context) => const MainScreen());
    }
  }
}
