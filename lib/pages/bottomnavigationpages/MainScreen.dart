// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/CurvedNavigationbar/curved_navigation_bar.dart';
import 'package:academy_shell/misc/alertlogout.dart';
import 'package:academy_shell/pages/bottomnavigationpages/Academy_screen.dart';
import 'package:academy_shell/pages/bottomnavigationpages/User_management_screen.dart';
import 'package:academy_shell/pages/bottomnavigationpages/student_screen.dart';
import 'package:academy_shell/pages/bottomnavigationpages/transport_screen.dart';
import 'package:academy_shell/pages/bottomnavigationpages/websitemanagementscreen.dart';
import 'package:academy_shell/widgets/Theme/theme_toggle_switch.dart';
import 'package:academy_shell/widgets/appbar.dart';
// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main-screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> appbarTitle = [
    "User Management",
    "Academy Management",
    "Student Manangement",
    "Transport Management",
    "Website Management",
  ];
  int currentPage = 0;
  List<Widget> bodyScreens = [
    UserManagementScreen(),
    AcademicsScreen(),
    StudentScreen(),
    TransportScreen(),
    WebsiteScreen(),
  ];

  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: WillPopScope(

        onWillPop: ()async{
          showDialog(context: context, builder: (ctx){
            return AlertDialog(title: Text("Do you want to close?"),actions: [TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('No',style: TextStyle(color: Colors.red),)),
              TextButton(onPressed: (){
                SystemNavigator.pop();
              },
                  child: Text('Yes',style: TextStyle(color: Colors.green)))],);
          });
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarCustom(
              action: [
                ThemeToggleSwitch(),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(

                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                              child: Wrap(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text('View Profile')),
                                  ListTile(
                                      leading: Icon(Icons.remove_red_eye),
                                      title: Text('Change Password')),
                                  ListTile(
                                      onTap: () {
                                        getAlertDialogbox(context);
                                      },
                                      leading: Icon(Icons.exit_to_app),
                                      title: Text('Logout')),


                                ],
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.person)),
                SizedBox(
                  width: 10,
                )
                // Row(

                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [Icon(Icons.sunny), Icon(Icons.menu)],
                // )
              ],
              title: appbarTitle.elementAt(currentPage),
            ),
          ),
          body: bodyScreens.elementAt(currentPage),
          bottomNavigationBar: CurvedNavigationBar(

            buttonBackgroundColor: Theme.of(context).brightness == Brightness.dark
             ? Colors.black : Colors.blue,
            items: [
              TabItem(MdiIcons.accountCircle, 'User '),
              TabItem(MdiIcons.townHall, 'Academy '),
              TabItem(MdiIcons.accountChildCircle, 'Student'),
              TabItem(MdiIcons.busMultiple, 'Transport'),
              TabItem(MdiIcons.web, 'Website'),
            ],
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
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
