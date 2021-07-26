import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TWEETSHortStyle {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void successSnackBar(String title, String message,
      {postion = SnackPosition.BOTTOM}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(message),
          ],
        ),
        duration: Duration(seconds: 1),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void errorSnackBar(title, message, {postion = SnackPosition.BOTTOM}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(message),
          ],
        ),
        duration: Duration(seconds: 1),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
