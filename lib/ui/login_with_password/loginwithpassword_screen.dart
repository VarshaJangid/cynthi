import 'package:cynthi/ui/component/login_text_field.dart';
import 'package:cynthi/ui/register/mobile_screen.dart';
import 'package:stacked/stacked.dart';
import '/ui/reset_password/reset_password_screen.dart';
import '/ui/component/app_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';
import 'loginwithpassword_view_model.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginWithPassViewModel>.reactive(
      viewModelBuilder: () => LoginWithPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Constants.cynthians,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 15),
                const Text(
                  Constants.logBack,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 15),
                const Text(
                  Constants.youAreAlreadyRegistered,
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                const Text(
                  Constants.logBackInToContinue,
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                LoginTextField(controller: viewModel.mobileNumber),
                const SizedBox(height: 30),
                AppTextField(
                  labelText: Constants.enterPassword,
                  isIcon: true,
                  controller: viewModel.password,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => AppRoutes.goto(context, const MobileScreen()),
                  child: const Center(
                    child: Text(
                      Constants.forgotYourPassword,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: Constants.Continue,
                  callback: () => viewModel.loginWithPassword(context),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: RichText(
                    text: const TextSpan(
                      text: Constants.buCreatingAnAccount,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: Constants.privacyPolicy,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
