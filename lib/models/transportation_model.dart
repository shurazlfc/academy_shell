
import 'package:academy_shell/pages/user_management_pages/academic_user/academy_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransporationModelCard {
  String text;
  String navigationRoute;
  IconData icon;

  TransporationModelCard({
    required this.text,
    required this.navigationRoute,
    required this.icon,
  });
}

List<TransporationModelCard> TransportationElements = [
  TransporationModelCard(
    text: " Vehicles",
    navigationRoute: AcademyUsers.routeName,
    icon: MdiIcons.accountCogOutline,
  ),
  TransporationModelCard(
    text: "Routes",
    navigationRoute: "/home",
    icon: MdiIcons.shieldAccountOutline,
  ),
  TransporationModelCard(
    text: "Drivers",
    navigationRoute: "/home",
    icon: MdiIcons.shieldKeyOutline,
  ),
];
