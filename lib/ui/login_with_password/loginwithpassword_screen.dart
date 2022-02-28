import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_text_style.dart';

import '/ui/component/login_text_field.dart';
import '/ui/component/app_text_field.dart';
import 'loginwithpassword_view_model.dart';
import '/ui/component/custom_button.dart';
import '/ui/register/mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginWithPassViewModel>.reactive(
      viewModelBuilder: () => LoginWithPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0XFFf6f2e7),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: BackgroundWidget(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.cynthians,
                      style: AppTextStyle.getStyle().comfortaaBold!.copyWith(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      Constants.logBack,
                      style: AppTextStyle.getStyle()
                          .openSansSemiBold!
                          .copyWith(fontSize: 24, color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      Constants.youAreAlreadyRegistered,
                      style: AppTextStyle.getStyle()
                          .openSansRegular!
                          .copyWith(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Constants.logBackInToContinue,
                      style: AppTextStyle.getStyle()
                          .openSansRegular!
                          .copyWith(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    LoginTextField(
                      controller: viewModel.mobileNumber,
                      changedCountry: viewModel.onCountryChange,
                    ),
                    const SizedBox(height: 30),
                    AppTextField(
                      obscureText: !viewModel.showPassword,
                      labelText: Constants.enterPassword,
                      isIcon: true,
                      controller: viewModel.password,
                      iconPressed: () => viewModel.togglePassVisibility(),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () =>
                          AppRoutes.goto(context, const MobileScreen()),
                      child: Center(
                        child: Text(
                          Constants.forgotYourPassword,
                          style: AppTextStyle.getStyle()
                              .openSansSemiBold!
                              .copyWith(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      title: Constants.Continue,
                      callback: () => viewModel.validation(context),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
          ),
        );
      },
    );
  }
}
