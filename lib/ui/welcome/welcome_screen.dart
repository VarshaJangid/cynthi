import '/ui/dashboard/dashboard_screen.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => AppRoutes.dismiss(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/200/300"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              Constants.welcomeAbroad,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              Constants.weAreHappyToHaveYou,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            const Spacer(),
            CustomButton(
              callback: () => AppRoutes.goto(context, const DashboardScreen()),
              title: Constants.begin,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
