import 'package:stacked/stacked.dart';

import '../reset_pass_view_model.dart';
import '/ui/component/login_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class ResetMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPassViewModel>.reactive(
      viewModelBuilder: () => ResetPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0XFFf6f2e7),
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => AppRoutes.dismiss(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    Constants.cynthians,
                    style: AppTextStyle.getStyle()
                        .comfortaaBold!
                        .copyWith(fontSize: 23, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    Constants.enterContactNumber,
                    style: AppTextStyle.getStyle()
                        .openSansSemiBold!
                        .copyWith(fontSize: 22, color: Colors.black),
                  ),
                  const SizedBox(height: 40),
                  LoginTextField(
                    controller: viewModel.mobileNumber,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    title: Constants.Continue,
                    callback: () {
                      viewModel.checkUserExist(context, viewModel.mobileNumber.text);
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
}
