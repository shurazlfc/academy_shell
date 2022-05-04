// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:academy_shell/services/academy_user_services.dart';
import 'package:academy_shell/models/academy_user_model.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AcademyUsers extends StatefulWidget {
  static const String routeName = "/academicsUser";
  const AcademyUsers({Key? key}) : super(key: key);

  @override
  State<AcademyUsers> createState() => _AcademyUsersState();
}

class _AcademyUsersState extends State<AcademyUsers> {
  bool isloaded = false;
  List<AcademyUserData>? academyUserData = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var data = await AcademyUserServices().getAcademyUsers();
    setState(() {
      academyUserData = data;
      isloaded = true;
    });
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
              rows: academyUserData!
                  .map((name) => DataRow(cells: [
                        //                   id;
                        // String? name;
                        // String? mobileNumber;
                        // String? email;
                        // int? academyId;
                        // Academy? academy;
                        // String? createdAt;
                        // int? role;
                        // RoleParsed? roleParsed;
                        // List<Permissions>? permissions;

                        DataCell(
                          Text(name.id.toString()),
                        ),
                        DataCell(
                          Text(name.name!),
                        ),
                        DataCell(
                          Text(
                            name.email!,
                          ),
                        ),
                        DataCell(name.roleParsed?.name != null
                            ? Text(name.roleParsed!.name!)
                            : Text('N/A')),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Edit"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(),
                                              Text(name.name!),
                                              Text(name.role.toString()),
                                              Text(name.email!),
                                            ],
                                          ),
                                        );
                                      });
                                  print(academyUserData!.indexOf(name));
                                },
                                icon: Icon(Icons.edit)),
                            // IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.recycling))
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

// var names = <Name>[
//   Name(
//       firstname: 'jack',
//       email: 'jack@gmail.com',
//       role: 'admin',
//       lastname: 'lastname'),
//   Name(
//       firstname: 'jack',
//       email: 'jack@gmail.com',
//       role: 'admin',
//       lastname: 'lastname'),
//   Name(
//       firstname: 'jack',
//       email: 'jack@gmail.com',
//       role: 'admin',
//       lastname: 'lastname'),
//   Name(
//       firstname: 'jack',
//       email: 'jack@gmail.com',
//       role: 'admin',
//       lastname: 'lastname'),
//   Name(
//       firstname: 'jack',
//       email: 'jack@gmail.com',
//       role: 'admin',
//       lastname: 'lastname')
// ];
