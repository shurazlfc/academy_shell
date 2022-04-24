import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/intropages/login_page.dart';

getAlertDialogbox(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 30,
          // backgroundColor: Colors.transparent,
          title: const Text('Logout'),
          content: const Text("Are you sure you want to logout ?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('No', style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.setString("token", "");

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.green),
                )),
          ],
        );
      });
}
