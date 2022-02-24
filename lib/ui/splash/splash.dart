import 'package:shared_preferences/shared_preferences.dart';

import '/ui/onboarding_screens/onboarding.dart';
import '/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';
import '/utils/app_route.dart';
import '/utils/auth.dart';

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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("Token is ------ ${prefs.getString("token")}");
      if (prefs.getString("token")!.isNotEmpty) {
        AppRoutes.makeFirst(context, const DashboardScreen());
      } else {
        AppRoutes.makeFirst(context, OnBoardingScreen());
      }
    } catch (e) {
      print('In Exception--$e');
      AppRoutes.makeFirst(context, OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0XFF08263d),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.logo, width: 120),
              const SizedBox(height: 20),
              const Text(
                Constants.cynthians,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
              RichText(
                text: const TextSpan(
                  text: 'App for ',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Knowledge',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFf26d1e))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
