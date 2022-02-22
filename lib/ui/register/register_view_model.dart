import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '/utils/app_methods.dart';
import 'dart:convert';

class RegisterViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  init(BuildContext context) async {
    firstName.addListener(() => notifyListeners());
    lastName.addListener(() => notifyListeners());
    createPassword.addListener(() => notifyListeners());
    confirmPassword.addListener(() => notifyListeners());
  }

}
