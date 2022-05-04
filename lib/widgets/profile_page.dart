import 'dart:io';

import 'package:academy_shell/app_text.dart';
import 'package:academy_shell/dummy_data/dummy_data.dart';
import 'package:academy_shell/models/profile_page_model.dart';
import 'package:academy_shell/widgets/app_large_Text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? pickedImage;

  static Future<XFile?> _pickImage(ImageSource imageSource)async{
   return await ImagePicker().pickImage(source: imageSource);

  }
  AlertDialog alert(){
    return AlertDialog(
      title: const Text("Change Profile Picture"),
      content: const Text( "Please Select Source"),
      actions: [
        TextButton(
          child:  const Text( "Camera",),
          onPressed:()async{
            XFile? file = await _pickImage(ImageSource.camera);
            setState(() {
              pickedImage = File(file!.path);
            });
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Gallery"),
          onPressed:()async{
            XFile? file = await _pickImage(ImageSource.gallery);
            setState(() {
              pickedImage = File(file!.path);
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              pickedImage != null ?
              CircleAvatar(radius: 80,backgroundImage:FileImage(pickedImage!) ,):
              CircleAvatar(backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black : Colors.blue, radius: 80),
              Positioned(
                top: 88,
                left: 80,
                child: IconButton(
                  onPressed: () async {
                    // show the dialog
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          AppLargeText(text: "USER INFORMATION", size: 20),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                ProfilePageModel profile = DummyData.profileElements[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "Username"),
                          AppText(text: profile.userName.toString()),
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "UserNumber"),
                          AppText(text: profile.userNumber.toString()),
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "UserEmail"),
                          AppText(text: profile.userEmail.toString()),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          ),
          AppLargeText(text: "ACADEMY INFORMATION", size: 20),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                ProfilePageModel profile = DummyData.profileElements[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "AcademyName"),
                          AppText(text: profile.academyName.toString()),
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "AcademyLocation"),
                          AppText(text: profile.academyLocation.toString()),
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "AcademyNumber"),
                          AppText(text: profile.academyNumber.toString()),
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(text: "AcademyEmail"),
                          AppText(text: profile.academyEmail.toString()),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
