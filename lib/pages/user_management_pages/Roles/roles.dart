// ignore_for_file: override_on_non_overriding_member

import 'package:academy_shell/models/role_user_model.dart';
import 'package:academy_shell/services/role_user_services.dart';
import 'package:flutter/material.dart';

class Roles extends StatefulWidget {
  static const String routeName = "/roles";
  const Roles({Key? key}) : super(key: key);

  @override
  State<Roles> createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  bool isloaded = false;
  List<RoleUserModel>? roledata = [];

  @override
  void initstate() {
    super.initState();
    getdata();
  }

  getdata() async {
    var data = await RoleUserServices().getRoles();
    setState(() {
      roledata = data;
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: const Text('S.N.'),
              numeric: true,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: const Text(' Name'),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: const Text('Email'),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: const Text('Role'),
              numeric: false,
              onSort: (i, b) {},
            ),
            DataColumn(
              label: const Text('Actions'),
              numeric: false,
              onSort: (i, b) {},
            )
          ],
          rows: [],
        ),
      ),
    );
  }
}
