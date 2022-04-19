// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:academy_shell/models/Academy_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcademicsScreen extends StatelessWidget {
  static const String routeName = "/academicsScreen";
  // static const String routeName = "/otp-page";
  const AcademicsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/academymanagement.svg',
                  height: 250,
                  width: MediaQuery.of(context).size.width - 20,
                  fit: BoxFit.contain,
                ),
                Container(
                  child: GridView.count(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      childAspectRatio: 8 / 6,
                      crossAxisCount: 3,
                      children: gridElements
                          .map((e) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, e.navigationRoute);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(4),
                                  // elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          e.icon,
                                          size: 40,
                                          color: Colors.blue,
                                        ),
                                        Text(
                                          e.text,
                                          // overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList()),
                )
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



// Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.accountCogOutline),
//                         title: Text('Levels'),
//                         subtitle: Text(
//                           'description about level',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.accountChild),
//                         // mdi mdi-account-cog-outline q-icon text-
//                         // mdi mdi-account-child q-icon text-
//                         // mdi mdi-shield-account-outline q-icon text-
//                         // mdi mdi-shield-key-outline q-icon text
//                         title: Text('Classes'),
//                         subtitle: Text(
//                           'Guardians Panel',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldAccountOutline),
//                         title: Text('Batches'),
//                         subtitle: Text(
//                           'Assign Roles to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Sections'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Subjects'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Class Routine'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Exam'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Exam Routine'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Calender Year'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       ListTile(
//                         leading: Icon(MdiIcons.shieldKeyOutline),
//                         title: Text('Holiday'),
//                         subtitle: Text(
//                           'Assign Permission to User',
//                           style:
//                               TextStyle(color: Colors.black.withOpacity(0.6)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),