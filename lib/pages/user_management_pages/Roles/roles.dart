import 'package:academy_shell/models/role_user_model.dart';

import 'package:academy_shell/services/role_user_services.dart';
import 'package:flutter/material.dart';

class UserRoles extends StatefulWidget {
  const UserRoles({Key? key}) : super(key: key);
  static const String routeName = "/userRoles";

  @override
  State<UserRoles> createState() => _UserRolesState();
}

class _UserRolesState extends State<UserRoles> {
  bool isloaded = false;
  List<RoleUserModel>? userRoleData = [];

  @override
  void initState() {
    super.initState();
    getUserRoles();
  }

  getUserRoles() async {
    var data = await UserRoleServices().getUserRoles();
    setState(() {
      userRoleData = data;
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Roles'),
        ),
        body: !isloaded
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userRoleData!.length,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ExpansionTile(
                      title: Text(userRoleData![index].name.toString()),
                      controlAffinity: ListTileControlAffinity.leading,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      children: [
                        Text(userRoleData![index].displayName.toString()),
                        Text(userRoleData![index].id.toString()),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
