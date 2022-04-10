// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:academy_shell/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({Key? key}) : super(key: key);
// AcademicsScreen
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Center(child: Text('Academy Management')),
        ),
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
                      crossAxisCount: 2,
                      children: gridElements
                          .map((e) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, e.navigationRoute);
                                },
                                child: Column(
                                  children: [Icon(e.icon), Text(e.text)],
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