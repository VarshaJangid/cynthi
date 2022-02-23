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
                const SizedBox(height: 40),
                LoginTextField(controller: viewModel.mobileNumber),
                const SizedBox(height: 40),
                CustomButton(
                  title: Constants.Continue,
                  callback: () {
                    Future.delayed(const Duration(microseconds: 500),
                        () => viewModel.loginWithOTP(context));
                  },
                ),
                const SizedBox(height: 20),
                Padding(
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
