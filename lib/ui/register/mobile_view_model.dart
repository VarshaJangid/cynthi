import 'dart:async';

import '/ui/reset_password/reset_password_screen.dart';
import '/ui/create_user/create_user_screen.dart';
import '/ui/otp_verify/otp_verify_screen.dart';
import '/model/login_with_otp_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/model/user_exist_model.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class MobileViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  LoginWithOtpModel loginWithOtpModel = LoginWithOtpModel();
  String otpSet = "";

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());

    reset();
    startTimer();
  }

  validation(BuildContext context) {
    if (mobileNumber.text.isEmpty || mobileNumber.text.length != 10) {
      flutterToast("Number is not valid !!", Colors.red);
    } else {
      Future.delayed(
          const Duration(microseconds: 500), () => loginWithOTP(context));
    }
  }

  // Login With OTP
  loginWithOTP(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/send_otp_mobile"),
          body: params);
      if (response.statusCode == 200) {
        loginWithOtpModel =
            LoginWithOtpModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        otpSet = "${loginWithOtpModel.otp}";
        notifyListeners();
        print("value otp $otpSet");

        AppRoutes.dismiss(context);
        if (loginWithOtpModel.message == "OTP send  successfully.") {
          flutterToast(loginWithOtpModel.message, Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(
              context,
              OtpVerifyScreen(
                mobileNumber: mobileNumber.text,
                otp: "${loginWithOtpModel.otp}",
              ));
        }
      } else {
        throw Exception('Exception in Login With OTP API');
      }
    } catch (e) {
      Exception("Exception in loginWithOTP API ----- $e");
    }
  }

  checkUserExist(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
    };
    showLoadingDialog(context);
    try {
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/check_newmobile_studlogin"),
          body: params);
      if (response.statusCode == 200) {
        print(response.statusCode);
        UserExistModel userExistModel =
            UserExistModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        if (userExistModel.loginType == 'exist') {
          //already exist
          flutterToast("You can reset your password.", Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(
              context, ResetPasswordScreen(mobileNumber: mobileNumber));
        } else {
          AppRoutes.dismiss(context);
          flutterToast("Please fill your details.", Colors.green);
          AppRoutes.goto(context, CreateUserScreen(mobile: mobileNumber));
        }
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }

  static const countdownDuration = Duration(seconds: 60);
  Duration duration = const Duration();
  Timer? timer;

  bool countDown = true;

  void reset() {
    if (countDown) {
      duration = countdownDuration;
      notifyListeners();
    } else {
      duration = const Duration();
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    notifyListeners();
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
    notifyListeners();
  }
}
