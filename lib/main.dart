// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/pages/intropages/login_page.dart';
import 'package:academy_shell/pages/bottomnavigationpages/MainScreen.dart';
import 'package:academy_shell/pages/intropages/onboarding_screen.dart';

import 'package:academy_shell/routes/route_handler.dart';
import 'package:academy_shell/widgets/Theme/themeprovider.dart';
import 'package:academy_shell/widgets/profile_page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String accessToken = "";

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

    setState(() {
      accessToken = sharedPreferences.getString("token") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ThemeProvider(),
    builder: (context, _) {
    final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        title: "Academy Shell",
        // theme: ThemeData.dark(),
        home: ProfilePageTwo(),
        // initialRoute: onboardingDisplayed
        //     ? OnboardingScreen.routeName
        //     : LoginPage.routeName,
        // onGenerateRoute: RouteHandler.generateRoute,
        // home: !(widget.onboardingDisplayed)
        //     ? OnboardingScreen()
        //     : (accessToken.isNotEmpty)
        //         ? MainScreen()
        //         : LoginPage(),
      );},
    );
  }
}
