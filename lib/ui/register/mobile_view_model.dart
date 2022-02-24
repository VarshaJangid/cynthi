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

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
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
        AppRoutes.dismiss(context);
        if (loginWithOtpModel.message == "OTP send  successfully.") {
          flutterToast(loginWithOtpModel.message, Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(
              context, OtpVerifyScreen(mobileNumber: mobileNumber.text));
        }
      } else {
        throw Exception('Exception in Login With OTP API');
      }
    } catch (e) {
      Exception("Exception in loginWithOTP API ----- $e");
    }
  }

  verifyOTP(BuildContext context, String mobileNumber) {
    print("Otp Controller ---- ${otpController.text}");
    // if(otpController.text == loginWithOtpModel.otp){
    if (loginWithOtpModel.otp == loginWithOtpModel.otp) {
      print("Go foe check ");
      checkUserExist(context, mobileNumber);
    } else {
      flutterToast("Wrong OTP !!!", Colors.red);
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
          AppRoutes.goto(context, const CreateUserScreen());
        }
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }
}
