import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_text_style.dart';

import '/ui/component/login_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_constant.dart';
import 'mobile_view_model.dart';
import '/utils/app_route.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MobileViewModel>.reactive(
      viewModelBuilder: () => MobileViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0XFFf6f2e7),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: BackgroundWidget(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 70, 30, 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    LoginTextField(controller: viewModel.mobileNumber),
                    const SizedBox(height: 40),
                    CustomButton(
                      title: Constants.Continue,
                      callback: () {
                        viewModel.validation(context);
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
          ),
        );
      },
    );
  }
}
