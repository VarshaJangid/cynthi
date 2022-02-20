import 'package:cynthi/ui/component/app_text_field.dart';
import 'package:cynthi/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => AppRoutes.dismiss(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constants.resetYourPassword,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            const Text(
              Constants.yourNewPassword,
              style: TextStyle(fontSize: 20, color: Color(0XFF666666)),
            ),
            const SizedBox(height: 60),
            AppTextField(
              labelText: Constants.createPassword,
              isIcon: true,
            ),
            const SizedBox(height: 30),
            AppTextField(
              labelText: Constants.confirmPassword,
              isIcon: true,
            ),
            const SizedBox(height: 40),
            CustomButton(
              title: Constants.resetPassword.toUpperCase(),
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}
