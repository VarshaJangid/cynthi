import 'dart:async';

import 'package:cynthi/utils/app_methods.dart';

import '/ui/reset_password/reset_pass_view_model.dart';
import '/utils/app_route.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';

class ResetOtpScreen extends StatefulWidget {
  const ResetOtpScreen({required this.viewModel});

  final ResetPassViewModel viewModel;

  @override
  _ResetOtpScreen createState() => _ResetOtpScreen();
}

class _ResetOtpScreen extends State<ResetOtpScreen> {
  Timer? _timer;
  int startTimer = 60;

  void startTime() {
    if (_timer != null) {
      _timer!.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (startTimer < 1) {
            timer.cancel();
          } else {
            startTimer = startTimer - 1;
            print("start $startTimer");
          }
        });
      });
    }
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFf6f2e7),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            widget.viewModel.otpVerify(context);
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
                  controller: widget.viewModel.otpController,
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
                child: Row(
                  children: [
                    Text(
                      Constants.otpShouldArrive + '$startTimer' + "s.",
                      style: AppTextStyle.getStyle()
                          .openSansRegular!
                          .copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        if (startTimer.toString() != "0") {
                          flutterToast("Please wait ... ", Colors.redAccent);
                        } else {
                          widget.viewModel.sendOtp(context);
                        }
                      },
                      child: Text(
                        Constants.resendOTP,
                        style: AppTextStyle.getStyle()
                            .openSansBold!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
