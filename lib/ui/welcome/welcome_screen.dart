import 'dart:io';

import 'package:cynthi/utils/app_text_style.dart';

import '/ui/dashboard/dashboard_screen.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.name, required this.imageFile}) : super(key: key);
  final String name;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf6f2e7),
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
                image: DecorationImage(
                  image: FileImage(
                    File(imageFile.path),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              Constants.welcomeAbroad + "\n$name!",
              style: AppTextStyle.getStyle()
                  .openSansSemiBold!
                  .copyWith(color: Colors.black, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              Constants.weAreHappyToHaveYou,
              style: AppTextStyle.getStyle()
                  .openSansSemiBold!
                  .copyWith(color: Colors.black, fontSize: 17),
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
