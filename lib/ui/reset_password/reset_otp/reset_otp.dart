import '/ui/reset_password/reset_pass_view_model.dart';
import '/utils/app_route.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';

class ResetOtpScreen extends StatelessWidget {
  const ResetOtpScreen({required this.viewModel});

  final ResetPassViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFf6f2e7),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            viewModel.otpVerify(context);
          },
          backgroundColor: Colors.grey,
          child: const Icon(Icons.arrow_forward_ios),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  AppRoutes.dismiss(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
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
                    text: Constants.otpShouldArrive,
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
      ),
    );
  }
}
