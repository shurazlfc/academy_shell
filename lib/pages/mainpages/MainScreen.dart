// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/CurvedNavigationbar/curved_navigation_bar.dart';
import 'package:academy_shell/pages/mainpages/Academy_screen.dart';
import 'package:academy_shell/pages/mainpages/User_management_screen.dart';
import 'package:academy_shell/pages/mainpages/student_screen.dart';
import 'package:academy_shell/pages/mainpages/transport_screen.dart';
// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main-screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  List<Widget> bodyScreens = [
    UserManagementScreen(),
    AcademicsScreen(),
    StudentScreen(),
    TransportScreen(),
  ];

  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: bodyScreens.elementAt(currentPage),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          TabItem(MdiIcons.accountCircle, 'User '),
          TabItem(MdiIcons.townHall, 'Academy '),
          TabItem(MdiIcons.accountChildCircle, 'Student'),
          TabItem(MdiIcons.busMultiple, 'Transport'),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
// mdi mdi-account-circle-outline q-icon
// mdi mdi-town-hall q-icon
// mdi mdi-account-child-circle q-icon
// mdi mdi-web q-icon
// mdi mdi-bus-multiple q-icon
// mdi mdi-cog q-icon
// mdi mdi-file-outline q-icon