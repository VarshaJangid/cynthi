import 'package:cynthi/ui/onboarding_screens/onboarding.dart';
import 'package:cynthi/utils/app_assets.dart';
import 'package:cynthi/utils/app_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => callScreen());
    super.initState();
  }

  callScreen() async {
    AppRoutes.goto(context, OnBoardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Card(
            elevation: 0,
            color: Colors.white.withOpacity(0.2),
            child: Image.asset(
                Assets.sad,
                width: 100
            ),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}