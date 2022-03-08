import 'package:pin_code_fields/pin_code_fields.dart';
import '/ui/register/mobile_view_model.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_methods.dart';
import '/utils/app_constant.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key, required this.otp, required this.viewModel})
      : super(key: key);
  final String otp;
  final MobileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(viewModel.duration.inSeconds.remainder(60));
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 1;
              viewModel.notifyListeners();
            },
            icon:
                const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
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
          GestureDetector(
            onTap: () {
              if (seconds.toString() != "00") {
                flutterToast("Please wait ... ", Colors.redAccent);
              } else {
                viewModel.sendOtp(context);
              }
            },
            child: RichText(
              text: TextSpan(
                text: Constants.otpShouldArrive + seconds + "s. ",
                style: AppTextStyle.getStyle()
                    .openSansRegular!
                    .copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: Constants.resendOTP,
                    style: AppTextStyle.getStyle()
                        .openSansBold!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
