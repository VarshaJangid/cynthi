import 'package:cynthi/utils/app_methods.dart';
import 'package:cynthi/utils/app_text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/ui/register/mobile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen(
      {Key? key, required this.mobileNumber, required this.otp})
      : super(key: key);
  final String mobileNumber;
  final String otp;

  @override
  Widget build(BuildContext context) {
    print("Number $mobileNumber");
    return ViewModelBuilder<MobileViewModel>.reactive(
      viewModelBuilder: () => MobileViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final seconds = twoDigits(viewModel.duration.inSeconds.remainder(60));
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
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              print("Otp is ------ ${viewModel.loginWithOtpModel.otp}");
              if (viewModel.otpController.text == otp) {
                print("Mobile ---- $mobileNumber");
                viewModel.checkUserExist(context, mobileNumber);
              } else {
                flutterToast("Wrong OTP !!!", Colors.red);
              }
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.arrow_forward_ios),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.verifyYourNumber,
                  style: AppTextStyle.getStyle()
                      .openSansSemiBold!
                      .copyWith(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 110),
                  child: PinCodeTextField(
                    autoFocus: true,
                    enablePinAutofill: true,
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: true,
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    obscuringCharacter: 'X',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "Enter OTP";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 35,
                      fieldWidth: 35,
                      activeFillColor: Colors.white,
                      activeColor: Colors.white,
                      selectedColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                    ),
                    controller: viewModel.otpController,
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: RichText(
                    text: TextSpan(
                      text: Constants.otpShouldArrive + seconds + "s. ",
                      style: AppTextStyle.getStyle()
                          .openSansRegular!
                          .copyWith(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: Constants.resendOTP,
                            style: AppTextStyle.getStyle()
                                .openSansBold!
                                .copyWith(color: Colors.black)),
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
