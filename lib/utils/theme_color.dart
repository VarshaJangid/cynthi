import 'package:flutter/material.dart';

// convenience
AppColor appColors() => const AppColor.getColor();

class AppColor {
  final Color primaryInactive;
  final Color primaryInactiveLight;
  final Color warning;
  final Color error;
  final Color buttonColor;
  final Color blueThemeColor;
  final Color dateButtonColor;
  final Color pinkColor;
  final Color lightBlue;
  final Color blueLightColor;
  final Color gray;
  final Color lightGray;
  final Color greenSuccess;
  final Color darkThemeColor;
  final Color chatListColor;
  final Color profileColor;
  final Color creamColor;
  final Color black;

  const AppColor({
    required this.warning,
    required this.error,
    required this.primaryInactive,
    required this.primaryInactiveLight,
    required this.buttonColor,
    required this.blueThemeColor,
    required this.dateButtonColor,
    required this.pinkColor,
    required this.lightBlue,
    required this.blueLightColor,
    required this.gray,
    required this.lightGray,
    required this.greenSuccess,
    required this.darkThemeColor,
    required this.chatListColor,
    required this.profileColor,
    required this.creamColor,
    required this.black,
  });

  const AppColor.getColor()
      : primaryInactive = Colors.blueGrey,
        primaryInactiveLight = Colors.grey,
        warning = const Color(0xFFC97100),
        error = const Color(0xFFFC3D0B),
        buttonColor = const Color(0xFFfe4b51),
        blueThemeColor = const Color(0xff622085),
        dateButtonColor = const Color(0xFFf3edf5),
        pinkColor = const Color(0xFFcd3899),
        lightBlue = const Color(0xFF9f27e0),
        blueLightColor = const Color(0xFF9061a9),
        gray = const Color(0xFF666666),
        lightGray = const Color(0xFFc4c4c4),
        greenSuccess = const Color(0xFF6bc259),
        darkThemeColor = const Color(0xFF510878),
        chatListColor = const Color(0xFFf3edf5),
        creamColor = const Color(0xFFfff2d1),
        profileColor = const Color(0xFF622085),
        black = const Color(0xFFF000000);
}