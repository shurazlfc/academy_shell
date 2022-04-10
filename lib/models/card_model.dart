import 'package:academy_shell/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardModel {
  String text;
  String navigationRoute;
  IconData icon;

  CardModel(
      {required this.icon, required this.navigationRoute, required this.text});
}

List<CardModel> gridElements = [
  CardModel(
      icon: Icons.menu, text: "Menu", navigationRoute: LoginPage.routeName),
  CardModel(icon: Icons.menu, text: "Menu", navigationRoute: "/home"),
  CardModel(icon: Icons.menu, text: "Menu", navigationRoute: "/home"),
  CardModel(icon: Icons.menu, text: "Menu", navigationRoute: "/home"),
  CardModel(icon: Icons.menu, text: "Menu", navigationRoute: "/home"),
  CardModel(icon: Icons.menu, text: "Menu", navigationRoute: "/home"),
];
