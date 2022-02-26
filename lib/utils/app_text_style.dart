import 'package:flutter/material.dart';

@immutable
class AppTextStyle {
  static const TextDecoration underline = TextDecoration.underline;
  static const TextDecoration lineThrough = TextDecoration.lineThrough;

  static const String _openSansBold = "OpenSans-Bold";
  static const String _openSansBoldItalic = "OpenSans-BoldItalic";
  static const String _openSansExtraBold = "OpenSans-ExtraBold";
  static const String _openSansExtraBoldItalic = "OpenSans-ExtraBoldItalic";
  static const String _openSansItalic = "OpenSans-Italic";
  static const String _openSansLightItalic = "OpenSans-LightItalic";
  static const String _openSansRegular = "OpenSans-Regular";
  static const String _openSansSemibold = "OpenSans-Semibold";
  static const String _openSansSemiboldItalic = "OpenSans-SemiboldItalic";
  static const String _comfortaaBold = "Comfortaa-Bold";

  final TextStyle? openSansBold;
  final TextStyle? openSansSemiBold;
  final TextStyle? openSansRegular;
  final TextStyle? openSansExtraBold;
  final TextStyle? comfortaaBold;

  AppTextStyle({
    this.openSansBold,
    this.openSansSemiBold,
    this.openSansRegular,
    this.openSansExtraBold,
    this.comfortaaBold,
  });

  AppTextStyle.getStyle()
      : comfortaaBold = const TextStyle(
          fontFamily: _comfortaaBold,
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          inherit: true,
        ),
        openSansBold = const TextStyle(
          fontFamily: _openSansBold,
          fontSize: 15,
          color: Colors.white,
          inherit: true,
        ),
        openSansRegular = const TextStyle(
          fontFamily: _openSansRegular,
          fontSize: 15,
          color: Colors.white,
          inherit: true,
        ),
        openSansExtraBold = const TextStyle(
          fontFamily: _openSansExtraBold,
          fontSize: 15,
          color: Colors.white,
          inherit: true,
        ),
        openSansSemiBold = const TextStyle(
          fontSize: 15,
          fontFamily: _openSansSemibold,
          color: Colors.white,
          inherit: false,
        );
}
