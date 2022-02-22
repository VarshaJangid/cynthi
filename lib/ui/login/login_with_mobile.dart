import 'package:cynthi/ui/login/login_view_model.dart';
import 'package:cynthi/ui/otp_verify/otp_verify_screen.dart';
import 'package:stacked/stacked.dart';

import '/ui/register/register_screen.dart';
import '/ui/component/custom_button.dart';
import '/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 70, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Constants.cynthians,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 15),
                const Text(
                  Constants.enterContactNumber,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 50,
                  width: 315,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
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
                        width: 240,
                        child: TextField(
                          autocorrect: true,
                          controller: viewModel.mobileNumber,
                          decoration: const InputDecoration(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(Constants.forgotPassword),
                    SizedBox(width: 25),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: Constants.Continue,
                  callback: () {
                    Future.delayed(const Duration(microseconds: 500),
                        () => viewModel.loginWithOTP(context));
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  // onTap: () => AppRoutes.goto(context, const RegisterScreen()),
                  onTap: () => AppRoutes.goto(context, OtpVerifyScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
