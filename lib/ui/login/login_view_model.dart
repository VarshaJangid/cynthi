import 'package:cynthi/model/user_exist_model.dart';
import 'package:cynthi/ui/dashboard/dashboard_screen.dart';
import 'package:cynthi/ui/otp_verify/otp_verify_screen.dart';
import 'package:cynthi/ui/register/register_screen.dart';
import 'package:cynthi/utils/app_route.dart';
import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '/utils/app_methods.dart';
import 'dart:convert';

class LoginViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  LoginWithOtpModel loginWithOtpModel = LoginWithOtpModel();

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
  }

  // Login With OTP
  loginWithOTP(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
    };
    final response = await http.post(
        Uri.parse("https://api.cynthians.com/index.php/api/send_otp_mobile"),
        body: params);
    if (response.statusCode == 200) {
      loginWithOtpModel = LoginWithOtpModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      if (loginWithOtpModel.message == "OTP send  successfully.") {
        flutterToast("OTP send  successfully.", Colors.green);
        AppRoutes.goto(
            context, OtpVerifyScreen(mobileNumber: mobileNumber.text));
      }
    } else {
      throw Exception('Exception in Login With OTP API');
    }
  }

  verifyOTP(BuildContext context, String mobileNumber) {
    print("Otp Controller ---- ${otpController.text}");
    print("Otp ---- ${loginWithOtpModel.otp}");
    if(otpController.text == loginWithOtpModel.otp){
    // if (loginWithOtpModel.otp == loginWithOtpModel.otp) {
      checkUserExist(context, mobileNumber);
    } else {
      flutterToast("Wrong OTP !!!", Colors.red);
    }
  }

  checkUserExist(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
    };
    final response = await http.post(
        Uri.parse(
            "https://api.cynthians.com/index.php/api/check_newmobile_studlogin"),
        body: params);
    if (response.statusCode == 200) {
      UserExistModel userExistModel =
          UserExistModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      if (userExistModel.loginType == 'exist') {
        flutterToast("Successfully Login.", Colors.green);
        AppRoutes.goto(context, const DashboardScreen());
      } else {
        AppRoutes.goto(context, const RegisterScreen());
      }
    }
  }
}
