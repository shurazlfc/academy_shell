// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:academy_shell/services/AcademyUserdata_response.dart';
import 'package:academy_shell/services/dataline.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AcademyUsers extends StatefulWidget {
  static const String routeName = "/academicsUser";
  const AcademyUsers({Key? key}) : super(key: key);

  @override
  State<AcademyUsers> createState() => _AcademyUsersState();
}

class _AcademyUsersState extends State<AcademyUsers> {
  AcademyUserData? academyUserData;

  @override
  void initState() {
    super.initState();
    fetchAcademyUsers();
  }

  fetchAcademyUsers() async {
    academyUserData = await AcademyUserServices().fetchAcademyData();
    if (mounted) {
      setState(() {});
    }
  }

  Widget bodyData() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('S.N.'),
                  numeric: true,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Text(' Name'),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Text('Email'),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Text('Role'),
                  numeric: false,
                  onSort: (i, b) {},
                ),
                DataColumn(
                  label: Text('Actions'),
                  numeric: false,
                  onSort: (i, b) {},
                )
                // ignore: prefer_const_literals_to_create_immutables
              ],

// String firstname;
//   String email;
//   String role;
//   String lastname;
              rows: names
                  .map((name) => DataRow(cells: [
                        DataCell(
                          Text(name.firstname),
                        ),
                        DataCell(
                          Text(name.email),
                        ),
                        DataCell(
                          Text(
                            name.role,
                          ),
                        ),
                        DataCell(
                          Text(name.lastname),
                        ),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  print(names.indexOf(name));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.recycling))
                          ],
                        )),
                      ]))
                  .toList()),
        ),
      );
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Academy User"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          labelText: 'Search',
                          hintText: 'name'),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  ContainerIcons(
                    backgroundcolor: Colors.green,
                    icons: Icons.add,
                  ),
                  ContainerIcons(
                      backgroundcolor: Colors.black, icons: Icons.file_copy),
                  ContainerIcons(
                      backgroundcolor: Colors.blue,
                      icons: Icons.change_circle_outlined),
                ],
              ),
              bodyData(),
            ],
          ),
        ));
  }
}

class ContainerIcons extends StatelessWidget {
  IconData? icons;
  Color? backgroundcolor;

  ContainerIcons({
    Key? key,
    required this.icons,
    required this.backgroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundcolor, borderRadius: BorderRadius.circular(20)),
        height: 20,
        width: 20,
        child: Icon(
          icons,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

class Name {
  String firstname;
  String email;
  String role;
  String lastname;
  Name({
    required this.firstname,
    required this.email,
    required this.role,
    required this.lastname,
  });
}

var names = <Name>[
  Name(
      firstname: 'jack',
      email: 'jack@gmail.com',
      role: 'admin',
      lastname: 'lastname'),
  Name(
      firstname: 'jack',
      email: 'jack@gmail.com',
      role: 'admin',
      lastname: 'lastname'),
  Name(
      firstname: 'jack',
      email: 'jack@gmail.com',
      role: 'admin',
      lastname: 'lastname'),
  Name(
      firstname: 'jack',
      email: 'jack@gmail.com',
      role: 'admin',
      lastname: 'lastname'),
  Name(
      firstname: 'jack',
      email: 'jack@gmail.com',
      role: 'admin',
      lastname: 'lastname')
];
