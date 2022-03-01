import 'package:percent_indicator/linear_percent_indicator.dart';
import '/ui/component/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'mobile_view_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MobileViewModel>.reactive(
      viewModelBuilder: () => MobileViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton:
              viewModel.currentIndex == 2 || viewModel.currentIndex == 4
                  ? FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        viewModel.currentIndex == 2
                            ? viewModel.otpVerify(context)
                            : viewModel.genderToNextScreen();
                      },
                      backgroundColor: Colors.grey,
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  : Container(),
          backgroundColor: const Color(0XFFf6f2e7),
          body: BackgroundWidget(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(00),
                    width: MediaQuery.of(context).size.width,
                    lineHeight: 10,
                    percent: viewModel.getCompletionPercentage(),
                    progressColor: const Color(0XFF08263d),
                  ),
                  const SizedBox(height: 20),
                  viewModel.registerFlow(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
