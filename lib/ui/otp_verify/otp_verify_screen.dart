import 'package:cynthi/ui/component/custom_button.dart';
import 'package:cynthi/ui/login/login_view_model.dart';
import 'package:cynthi/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: Colors.grey,
            child: const Icon(Icons.arrow_forward_ios),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 70, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  Constants.verifyYourNumber,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 200),
                // PinCodeTextField(
                //   appContext: context,
                //   pastedTextStyle: TextStyle(
                //     color: Colors.green.shade600,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   length: 4,
                //   obscureText: true,
                //   obscuringCharacter: '*',
                //   obscuringWidget: FlutterLogo(
                //     size: 24,
                //   ),
                //   blinkWhenObscuring: true,
                //   animationType: AnimationType.fade,
                //   validator: (v) {
                //     if (v!.length < 3) {
                //       return "I'm from validator";
                //     } else {
                //       return null;
                //     }
                //   },
                //   pinTheme: PinTheme(
                //     shape: PinCodeFieldShape.box,
                //     borderRadius: BorderRadius.circular(5),
                //     fieldHeight: 50,
                //     fieldWidth: 40,
                //     activeFillColor: Colors.white,
                //   ),
                //   cursorColor: Colors.black,
                //   animationDuration: Duration(milliseconds: 300),
                //   enableActiveFill: true,
                //   errorAnimationController: errorController,
                //   controller: textEditingController,
                //   keyboardType: TextInputType.number,
                //   boxShadows: [
                //     BoxShadow(
                //       offset: Offset(0, 1),
                //       color: Colors.black12,
                //       blurRadius: 10,
                //     )
                //   ],
                //   onCompleted: (v) {
                //     print("Completed");
                //   },
                //   // onTap: () {
                //   //   print("Pressed");
                //   // },
                //   onChanged: (value) {
                //     print(value);
                //     // setState(() {
                //     //   currentText = value;
                //     // });
                //   },
                //   beforeTextPaste: (text) {
                //     print("Allowing to paste $text");
                //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //     return true;
                //   },
                // ),
                TextField
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: Constants.otpShouldArrive,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: Constants.resendOTP,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
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
