import 'package:academy_shell/pages/academy_management_pages/academy_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserModelCard {
  String text;
  String navigationRoute;
  IconData icon;

  UserModelCard({
    required this.text,
    required this.navigationRoute,
    required this.icon,
  });
}

List<UserModelCard> userElements = [
  UserModelCard(
    text: " Academy User",
    navigationRoute: AcademyUsers.routeName,
    icon: MdiIcons.accountCogOutline,
  ),
  UserModelCard(
    text: "Roles",
    navigationRoute: "/home",
    icon: MdiIcons.shieldAccountOutline,
  ),
  UserModelCard(
    text: "Permission",
    navigationRoute: "/home",
    icon: MdiIcons.shieldKeyOutline,
  ),
];
