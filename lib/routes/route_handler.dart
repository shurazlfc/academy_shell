// import 'dart:js';

// ignore_for_file: unused_import

import 'package:academy_shell/pages/academy_management_pages/academy_users.dart';
import 'package:academy_shell/pages/auth/login_page.dart';
import 'package:academy_shell/pages/views/main_screen.dart';
import 'package:academy_shell/pages/auth/new_password_afterOTP.dart';
import 'package:academy_shell/pages/auth/onboarding_screen.dart';
import 'package:academy_shell/pages/auth/otp_page.dart';
import 'package:academy_shell/pages/auth/register_page.dart';
import 'package:academy_shell/pages/auth/resetpassword_page.dart';
import 'package:academy_shell/services/login_services.dart';
import 'package:flutter/material.dart';

//outside routes
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

      case AcademyUsers.routeName:
        return MaterialPageRoute(builder: (context) => const AcademyUsers());

      case NewPassword.routeName:
        return MaterialPageRoute(builder: ((context) => const NewPassword()));
      default:
        return MaterialPageRoute(builder: (context) => const MainScreen());
    }
  }
}
// now inside application routes 

