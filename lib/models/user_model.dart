import 'package:academy_shell/pages/user_management_pages/Roles/roles.dart';
import 'package:academy_shell/pages/user_management_pages/academic_user/academy_users.dart';
import 'package:academy_shell/pages/user_management_pages/permission/permission.dart';
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
    navigationRoute: UserRoles.routeName,
    icon: MdiIcons.shieldAccountOutline,
  ),
  UserModelCard(
    text: "Permission",
    navigationRoute: UserPermissionScreen.routeName,
    icon: MdiIcons.shieldKeyOutline,
  ),
];
