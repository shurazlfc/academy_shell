// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/pages/intropages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "/OnBoarding-Screen";
  OnboardingScreen({Key? key}) : super(key: key);
  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'First Page',
        body: "Description",
        image: Center(
          child: SvgPicture.asset('assets/images/aaa.svg'),
        )),
    PageViewModel(
        title: 'Second Page',
        body: "Description",
        image: Center(
          child: SvgPicture.asset('assets/images/reading.svg'),
        )),
    PageViewModel(
        title: 'Third Page',
        body: "Description",
        image: Center(child: SvgPicture.asset('assets/images/notes.svg'))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: IntroductionScreen(
            pages: pages,
            dotsDecorator: DotsDecorator(
              size: Size(10, 10),
              color: Colors.white,
              activeSize: Size.square(15),
              activeColor: Colors.redAccent,
            ),
            showDoneButton: true,
            done: Text(
              'Done',
              style: TextStyle(fontSize: 20),
            ),
            showSkipButton: true,
            back: Text('back'),
            skip: InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.routeName);
              },
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 20),
              ),
            ),
            showNextButton: true,
            next: Icon(
              Icons.arrow_forward,
              size: 25,
              color: Colors.green,
            ),
            onDone: () {
              onDone(context);
            },
          ),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.onBoardingDisplayed, true);
    Navigator.pushNamed(context, LoginPage.routeName);
  }
}
