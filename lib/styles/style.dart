import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../extentions/num.dart';

class TWEETSHortStyle {
  static const String errorWarning = "assets/svg/error-warning-line.svg";
  static const String checkCircle = "assets/svg/check_circle.svg";
  static const String download = "assets/svg/download.svg";

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void successSnackBar(String message, [String icon = checkCircle]) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 5.text,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        duration: Duration(seconds: 2),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void errorSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              errorWarning,
              width: 10.text,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(child: Text(message)),
          ],
        ),
        duration: Duration(seconds: 1),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        backgroundColor: hexToColor("#ea001e"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
