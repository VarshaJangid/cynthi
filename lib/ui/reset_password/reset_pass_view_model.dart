import 'package:cynthi/model/user_exist_model.dart';
import 'package:cynthi/ui/create_user/create_user_screen.dart';
import 'package:cynthi/ui/dashboard/dashboard_screen.dart';
import 'package:cynthi/ui/otp_verify/otp_verify_screen.dart';
import 'package:cynthi/ui/reset_password/reset_password_screen.dart';
import 'package:cynthi/utils/app_route.dart';
import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '/utils/app_methods.dart';
import 'dart:convert';

class ResetPassViewModel extends BaseViewModel {
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  init(BuildContext context) async {
    pass.addListener(() => notifyListeners());
    confirmPass.addListener(() => notifyListeners());
  }


}
