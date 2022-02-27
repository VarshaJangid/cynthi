import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_methods.dart';
import 'package:cynthi/utils/app_text_style.dart';

import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/ui/gender/gender_screen.dart';
import 'package:stacked/stacked.dart';
import 'create_user_view_model.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key, required this.mobile}) : super(key: key);
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateUserViewModel>.reactive(
      viewModelBuilder: () => CreateUserViewModel(),
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
          body: BackgroundWidget(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.cynthians,
                    style: AppTextStyle.getStyle()
                        .comfortaaBold!
                        .copyWith(fontSize: 24, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    Constants.createYourAccount,
                    style: AppTextStyle.getStyle()
                        .openSansSemiBold!
                        .copyWith(fontSize: 24, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    Constants.createAnAccountToGetStarted,
                    style: AppTextStyle.getStyle()
                        .openSansRegular!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: textField(context, Constants.firstName,
                            viewModel.firstName, !viewModel.showPassword, viewModel, false),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        child: textField(context, Constants.lastName,
                            viewModel.lastName, !viewModel.showPassword, viewModel, false),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  textField(context, Constants.createPassword, viewModel.password,
                      !viewModel.showPassword, viewModel, true),
                  const SizedBox(height: 40),
                  textField(context, Constants.confirmPassword,
                      viewModel.confirmPassword, !viewModel.showPassword, viewModel, true),
                  const SizedBox(height: 40),
                  CustomButton(
                      title: Constants.next,
                      callback: () {
                        if (viewModel.firstName.text.isEmpty ||
                            viewModel.lastName.text.isEmpty ||
                            viewModel.password.text.isEmpty ||
                            viewModel.confirmPassword.text.isEmpty) {
                          flutterToast("Please enter valid data !! ", Colors.red);
                        } else {
                          if (viewModel.password.text ==
                              viewModel.confirmPassword.text) {
                            AppRoutes.goto(
                              context,
                              GenderScreen(
                                firstName: viewModel.firstName.text,
                                lastName: viewModel.lastName.text,
                                password: viewModel.password.text,
                                mobile: mobile,
                              ),
                            );
                          } else {
                            flutterToast(
                                "Password does not match !!!", Colors.red);
                          }
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: RichText(
                      text: TextSpan(
                        text: Constants.buCreatingAnAccount,
                        style: AppTextStyle.getStyle()
                            .openSansRegular!
                            .copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                              text: Constants.privacyPolicy,
                              style: AppTextStyle.getStyle()
                                  .openSansBold!
                                  .copyWith(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget textField(
          BuildContext context,
          String title,
          TextEditingController controller,
          bool obscureText,
          CreateUserViewModel model,
      bool isIcon) =>
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .08,
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          cursorColor: Colors.black,
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 33),
            labelText: title,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility_rounded,
                size: 20,
                color: isIcon == true ? Colors.black : Colors.transparent,
              ),
              onPressed: () => model.togglePassVisibility(),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
      );
}
