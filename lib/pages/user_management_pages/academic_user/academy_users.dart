// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_local_variable

import 'package:academy_shell/models/academy_user_model.dart';
import 'package:academy_shell/services/academy_user_services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
    getAcademyData();
  }

  getAcademyData() async {
    var data = await AcademyUserServices().getAcademyUsers();
    setState(() {
      academyUserData = data;
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AcademyUser'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: !isloaded
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: academyUserData!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ExpansionTile(
                        title: Text(academyUserData![index].name.toString()),
                        // subtitle: Text(academyUserData![index].email.toString()),
                        controlAffinity: ListTileControlAffinity.leading,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => AcademyUserEdit(
                                        userData: academyUserData![index])));
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                        children: [
                          Text(academyUserData![index].email.toString()),
                          Text(academyUserData![index].mobileNumber.toString()),
                          Text(academyUserData![index]
                              .roleParsed!
                              .displayName
                              .toString()),
                          Text(academyUserData![index].createdAt.toString()),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class AcademyUserEdit extends StatefulWidget {
  const AcademyUserEdit({Key? key, required this.userData}) : super(key: key);
  final AcademyUserData userData;

  @override
  State<AcademyUserEdit> createState() => _AcademyUserEditState();
}

class _AcademyUserEditState extends State<AcademyUserEdit> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _numberController.text = widget.userData.mobileNumber ?? "";
    _nameController.text = widget.userData.name ?? "";
    _emailController.text = widget.userData.email ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
              controller: _nameController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _numberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Number')),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: () {}, child: Text('SUBMIT'))
          ]),
        ),
      ),
    );
  }
}
























































 // Builder(builder: (context) {
          //   Permissions permissions = widget.userData.permissions!.first;
          //   return DropdownButton<Permissions>(
          //     items: widget.userData.permissions!
          //         .map((e) => DropdownMenuItem<Permissions>(
          //             value: e, child: Text(e.value.toString())))
          //         .toList(),
          //     onChanged: (value) {},
          //     value: widget.userData.permissions!.first,
          //   );
          // }),