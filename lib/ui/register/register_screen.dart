import 'package:cynthi/ui/register/register_view_model.dart';
import 'package:stacked/stacked.dart';

import '/ui/reset_password/reset_password_screen.dart';
import '/ui/component/app_text_field.dart';
import '/ui/component/custom_button.dart';
import '/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                SizedBox(
                  height: 50,
                  width: 315,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 55,
                        child: TextField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            labelText: '+91',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  topLeft: Radius.circular(15.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 260,
                        child: TextField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 30),
                            labelText: Constants.mobileNumber,
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                AppTextField(labelText: Constants.enterPassword, isIcon: true),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () =>
                      AppRoutes.goto(context, const ResetPasswordScreen()),
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
                  callback: (){},
                  // callback: () => AppRoutes.goto(context, SignUpScreen()),
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
