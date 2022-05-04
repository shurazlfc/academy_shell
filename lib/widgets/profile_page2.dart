import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageTwo extends StatefulWidget {
  const ProfilePageTwo({Key? key}) : super(key: key);

  @override
  _ProfilePageTwoState createState() => _ProfilePageTwoState();
}

class _ProfilePageTwoState extends State<ProfilePageTwo> {
  File? imagePicked;

  Future<XFile?> pickedImage(ImageSource source) async {
    return await ImagePicker().pickImage(source: source);
  }

  AlertDialog alertbox() {
    return AlertDialog(
      title: const Text("Change Photo"),
      content: const Text("Choose Source"),
      actions: [
        TextButton(
            onPressed: () async {
              XFile? file = await pickedImage(ImageSource.camera);
              setState(() {
                imagePicked = File(file!.path);
              });
            },
            child: const Text("Camera")),
        TextButton(
            onPressed: () async {
              XFile? file = await pickedImage(ImageSource.gallery);
              setState(() {
                imagePicked = File(file!.path);
              });
            },
            child: const Text("Gallery"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(children: [
              imagePicked != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(imagePicked!),
                      radius: 80,
                    )
                  : const CircleAvatar(backgroundColor: Colors.red, radius: 80),
              Positioned(
                left: 70,
                top: 90,
                child: IconButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return alertbox();
                          });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 80,
                    )),
              ),
            ]),
            Text('whats asdasdas '),
            Text('whats asdasdas '),
            Text('whats asdasdas '),
          ],
        ),
      ),
    );
  }
}
