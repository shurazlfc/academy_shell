import 'package:academy_shell/pages/intropages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AcademyModelcard {
  String text;
  String navigationRoute;
  IconData icon;

  AcademyModelcard(
      {required this.icon, required this.navigationRoute, required this.text});
}

List<AcademyModelcard> gridElements = [
  AcademyModelcard(
      icon: MdiIcons.ladder,
      text: " Level",
      navigationRoute: LoginPage.routeName),
  AcademyModelcard(
      icon: MdiIcons.humanMaleBoard, text: "Classes", navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.clipboardList, text: "Batches", navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.vectorIntersection,
      text: "Sections",
      navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.abTesting, text: "Subjects", navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.calendarCheck,
      text: "Class Routine",
      navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.fileQuestion, text: "Exam", navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.calendar, text: "Exam Routine", navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.calendarAccount,
      text: "Calender Year",
      navigationRoute: "/home"),
  AcademyModelcard(
      icon: MdiIcons.calendarAlert, text: "Holiday", navigationRoute: "/home"),
];
