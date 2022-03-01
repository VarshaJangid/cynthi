import 'package:flutter/cupertino.dart';
import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_text_style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '/ui/component/login_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_constant.dart';
import 'mobile_view_model.dart';
import '/utils/app_route.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ViewModelBuilder<MobileViewModel>.reactive(
      viewModelBuilder: () => MobileViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: viewModel.currentIndex == 2 || viewModel.currentIndex == 4
              ? FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    viewModel.currentIndex == 2 ? viewModel.otpVerify(context):viewModel.genderToNextScreen();
                  },
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.arrow_forward_ios),
                )
              : Container(),
          backgroundColor: const Color(0XFFf6f2e7),
          body: BackgroundWidget(
              child: SingleChildScrollView(
                  // padding: const EdgeInsets.fromLTRB(30, 00, 30, 10),
                  child: Column(
            children: [
              LinearPercentIndicator(
                  padding: const EdgeInsets.all(01),
                  width: MediaQuery.of(context).size.width,
                  lineHeight: 12.0,
                  percent: viewModel.getCompletionPercentage(),
                  progressColor: Colors.green),
              const SizedBox(
                height: 20,
              ),
              viewModel.registerFlow(),
            ],
          ))),
        );
      },
    );
  }
}
