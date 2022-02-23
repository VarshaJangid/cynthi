import 'package:cynthi/model/user_exist_model.dart';
import 'package:cynthi/ui/create_user/create_user_screen.dart';
import 'package:cynthi/ui/dashboard/dashboard_screen.dart';
import 'package:cynthi/ui/otp_verify/otp_verify_screen.dart';
import 'package:cynthi/utils/app_route.dart';
import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateUserViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();

  init(BuildContext context) async {
    firstName.addListener(() => notifyListeners());
    lastName.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
  }

}
