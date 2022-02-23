import 'package:cynthi/model/login_pass_model.dart';
import 'package:cynthi/ui/dashboard/dashboard_screen.dart';
import 'package:cynthi/utils/app_route.dart';

import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '/utils/app_methods.dart';
import 'dart:convert';

class RegisterViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginPassModel loginPassModel = LoginPassModel();

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
  }

  // login
  loginWithPassword(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
      'password': password.text,
      'source_id': '1',
    };
    final response = await http.post(
        Uri.parse("https://api.cynthians.com/index.php/api/studentlogin"),
        body: params);
    if (response.statusCode == 200) {
      loginPassModel = LoginPassModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      AppRoutes.goto(context, DashboardScreen());
    }
  }
}
