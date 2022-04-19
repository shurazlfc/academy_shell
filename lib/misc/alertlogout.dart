import 'package:flutter/material.dart';

// class LogoutAlert extends StatelessWidget {
//   const LogoutAlert({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       // backgroundColor: Colors.transparent,
//       title: Text('Logout'),
//       content: Text("Are you sure you want to logout "),
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(true);
//             },
//             child: Text('Yes')),
//         TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('No')),
//       ],
//     );
//   }
// }

getAlertDialogbox(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 30,
          // backgroundColor: Colors.transparent,
          title: Text('Logout'),
          content: Text("Are you sure you want to logout ?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Yes',
                  style: const TextStyle(color: Colors.green),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('No', style: const TextStyle(color: Colors.red))),
          ],
        );
      });
}
