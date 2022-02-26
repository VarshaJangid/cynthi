import 'package:cynthi/utils/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/ui/onboarding_screens/onboarding.dart';
import '/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';
import '/utils/app_route.dart';

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
      if (prefs.getString("token")!.isNotEmpty) {
        AppRoutes.makeFirst(context, const DashboardScreen());
      } else {
        AppRoutes.makeFirst(context, OnBoardingScreen());
      }
    } catch (e) {
      Exception('In Exception--$e');
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
              Text(
                Constants.cynthians,
                style: AppTextStyle.getStyle().openSansBold!.copyWith(
                      fontSize: 30,
                    ),
              ),
              RichText(
                text: TextSpan(
                  text: 'App for ',
                  style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                        fontSize: 22,
                      ),
                  children: [
                    TextSpan(
                      text: 'Knowledge',
                      style: AppTextStyle.getStyle()
                          .openSansSemiBold!
                          .copyWith(fontSize: 22, color: const Color(0XFFf26d1e)),
                    ),
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
