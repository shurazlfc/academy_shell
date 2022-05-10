import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went'}) {
    Get.dialog(Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title ?? ''),
          Text(description ?? ''),
          ElevatedButton(
              onPressed: () {
                if (Get.isDialogOpen != null) Get.back();
              },
              child: const Text('Okay'))
        ],
      ),
    ));
  }
}
