import '/ui/login_with_password/loginwithpassword_screen.dart';
import 'package:http/http.dart' as http;
import '/model/reset_pass_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class ResetPassViewModel extends BaseViewModel {
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  init(BuildContext context) async {
    pass.addListener(() => notifyListeners());
    confirmPass.addListener(() => notifyListeners());
  }


  bool _showPassword = false;
  bool get showPassword => _showPassword;

  //show Password
  void togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }



  validation(BuildContext context, String mobileNumber) {
    if (pass.text.isEmpty ||
        confirmPass.text.isEmpty ||
        pass.text != confirmPass.text) {
      flutterToast("Enter valid/ similar password !!", Colors.red);
    } else {
      Future.delayed(const Duration(milliseconds: 600),
          () => resetPassword(context, mobileNumber));
    }
  }

  //Reset User Password
  resetPassword(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
      'password': pass.text,
      'action': 'reset',
      "source_id": '1'
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/save_studentPassword"),
          body: params);
      if (response.statusCode == 200) {
        ResetPassModel resetPassModel =
            ResetPassModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        print(resetPassModel.message);
        if (resetPassModel.message == 'Reset Password Successfully') {
          flutterToast(resetPassModel.message, Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(context, const LoginWithPasswordScreen());
        } else {
          flutterToast(resetPassModel.message, Colors.red);
          AppRoutes.dismiss(context);
        }
      }
    } catch (e) {
      Exception("Exception is ---- $e");
    }
  }
}
