// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Center(child: Text('User Management')),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/management.svg',
                    fit: BoxFit.fitWidth,
                  )),
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //     color: Colors.red, borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                        leading: Icon(MdiIcons.accountCogOutline),
                        title: Text('User'),
                        subtitle: Text(
                          'Change User Attributes',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                        leading: Icon(MdiIcons.accountChild),
                        // mdi mdi-account-cog-outline q-icon text-
                        // mdi mdi-account-child q-icon text-
                        // mdi mdi-shield-account-outline q-icon text-
                        // mdi mdi-shield-key-outline q-icon text
                        title: Text('Guardians'),
                        subtitle: Text(
                          'Guardians Panel',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                        leading: Icon(MdiIcons.shieldAccountOutline),
                        title: Text('Roles'),
                        subtitle: Text(
                          'Assign Roles to User',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                        leading: Icon(MdiIcons.shieldKeyOutline),
                        title: Text('Permission'),
                        subtitle: Text(
                          'Assign Permission to User',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// mdi mdi-account-cog-outline q-icon text-
// mdi mdi-account-child q-icon text-
// mdi mdi-shield-account-outline q-icon text-
// mdi mdi-shield-key-outline q-icon text-
