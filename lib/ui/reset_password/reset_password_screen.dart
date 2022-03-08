import '/ui/reset_password/reset_pass_view_model.dart';
import '/ui/component/background_widget.dart';
import '/ui/component/app_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.viewModel})
      : super(key: key);
  final ResetPassViewModel viewModel;

  @override
  _ResetPasswordScreen createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                  obscureText: !showPassword,
                  controller: widget.viewModel.pass,
                  labelText: Constants.createPassword,
                  isIcon: true,
                  iconPressed: () => togglePassVisibility(),
                ),
                const SizedBox(height: 30),
                AppTextField(
                  controller: widget.viewModel.confirmPass,
                  labelText: Constants.confirmPassword,
                  isIcon: true,
                  iconPressed: () => toggleConfirmPassVisibility(),
                  obscureText: !showConfirmPassword,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: Constants.resetPassword.toUpperCase(),
                  callback: () {
                    widget.viewModel.validation(
                        context, widget.viewModel.mobileNumber.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  //show Password
  void togglePassVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _showConfirmPassword = false;

  bool get showConfirmPassword => _showConfirmPassword;

  //show Confirm Password
  void toggleConfirmPassVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }
}
