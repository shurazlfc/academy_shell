import 'package:academy_shell/pages/views/core/academy_management_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StudentManagementCard {
  String text;
  String navigationRoute;
  IconData icon;

  StudentManagementCard({
    required this.text,
    required this.navigationRoute,
    required this.icon,
  });
}

List<StudentManagementCard> studentElements = [
  StudentManagementCard(
    text: "Student",
    navigationRoute: AcademicsScreen.routeName,
    icon: MdiIcons.accountGroupOutline,
  ),
  StudentManagementCard(
      text: "Student Attendence",
      navigationRoute: "/home",
      icon: MdiIcons.presentation),
  StudentManagementCard(
      text: "Assignments", navigationRoute: "/home", icon: MdiIcons.book),
  StudentManagementCard(
    text: "Student Assignment",
    navigationRoute: "/home",
    icon: MdiIcons.bookAccount,
  ),
];
