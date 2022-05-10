import 'package:flutter/material.dart';

import '../../../models/academy_permission_model.dart';
import '../../../services/academy_permission_services.dart';

class UserPermissionScreen extends StatefulWidget {
  const UserPermissionScreen({Key? key}) : super(key: key);
  static const String routeName = "/user-permission";

  @override
  State<UserPermissionScreen> createState() => _UserPermissionScreenState();
}

class _UserPermissionScreenState extends State<UserPermissionScreen> {
  bool isloaded = false;
  List<AcademyPermissionModel>? academyUserData = [];

  Future<void> getdata() async {
    var data = await AcademyPermissionServices().getAcademyPermission();
    setState(() {
      academyUserData = data;
      isloaded = true;
    });
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
      ),
      body: !isloaded
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: academyUserData!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Text(academyUserData![index]
                                  .displayName
                                  .toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ));
                      }),
                ),
              ],
            ),
    ));
  }
}
