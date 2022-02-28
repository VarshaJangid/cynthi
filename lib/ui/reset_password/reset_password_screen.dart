import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_text_style.dart';

import '/ui/reset_password/reset_pass_view_model.dart';
import '/ui/component/app_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key, required this.mobileNumber})
      : super(key: key);
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPassViewModel>.reactive(
      viewModelBuilder: () => ResetPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0XFFf6f2e7),
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
          body: BackgroundWidget(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.resetYourPassword,
                    style: AppTextStyle.getStyle()
                        .openSansBold!
                        .copyWith(fontSize: 24, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Constants.yourNewPassword,
                    style: AppTextStyle.getStyle()
                        .openSansRegular!
                        .copyWith(fontSize: 20, color: const Color(0XFF666666)),
                  ),
                  const SizedBox(height: 60),
                  AppTextField(
                    obscureText: !viewModel.showPassword,
                    controller: viewModel.pass,
                    labelText: Constants.createPassword,
                    isIcon: true,
                    iconPressed: () => viewModel.togglePassVisibility(),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    controller: viewModel.confirmPass,
                    labelText: Constants.confirmPassword,
                    isIcon: true,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    title: Constants.resetPassword.toUpperCase(),
                    callback: () => viewModel.validation(context, mobileNumber),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
