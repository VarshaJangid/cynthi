import 'package:cynthi/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/ui/splash/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: const AppColor.getColor().theme,
      statusBarColor: const AppColor.getColor().theme,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cynthi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
