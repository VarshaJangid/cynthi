import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/ui/register/mobile_view_model.dart';
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
  const CreateUserScreen({Key? key, required this.mobile, required this.viewModel}) : super(key: key);
  final String mobile;
  final MobileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
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
                        viewModel.firstName, false, viewModel, false),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 150,
                    child: textField(context, Constants.lastName,
                        viewModel.lastName, false, viewModel, false),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              textField(
                  context,
                  Constants.createPassword,
                  viewModel.password,
                  !viewModel.showPassword,
                  viewModel,
                  true),
              const SizedBox(height: 40),
              textField(
                  context,
                  Constants.confirmPassword,
                  viewModel.confirmPassword,
                  !viewModel.showPassword,
                  viewModel,
                  true),
              const SizedBox(height: 40),
              CustomButton(
                  title: Constants.next,
                  callback: () {
                    viewModel.genderScreen(context);
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
  }

  Widget textField(
          BuildContext context,
          String title,
          TextEditingController controller,
          bool obscureText,
          MobileViewModel model,
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
            fillColor: const Color(0XFFf6f2e7),
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
