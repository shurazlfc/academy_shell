import 'package:academy_shell/pages/views/core/academy_management_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WebsiteCardModel {
  String text;
  String navigationRoute;
  IconData icon;

  WebsiteCardModel({
    required this.text,
    required this.navigationRoute,
    required this.icon,
  });
}

List<WebsiteCardModel> webelements = [
  WebsiteCardModel(
    text: "Menu",
    navigationRoute: AcademicsScreen.routeName,
    icon: MdiIcons.menu,
  ),
  WebsiteCardModel(
      text: "Banners", navigationRoute: "/home", icon: MdiIcons.billboard),
  WebsiteCardModel(
      text: "About", navigationRoute: "/home", icon: MdiIcons.helpBox),
  WebsiteCardModel(
    text: "Contents",
    navigationRoute: "/home",
    icon: MdiIcons.sticker,
  ),
  WebsiteCardModel(
    text: "Links",
    navigationRoute: "/home",
    icon: MdiIcons.stickerAlert,
  ),
  WebsiteCardModel(
    text: "Testimonals",
    navigationRoute: "/home",
    icon: MdiIcons.chartBubble,
  ),
];
