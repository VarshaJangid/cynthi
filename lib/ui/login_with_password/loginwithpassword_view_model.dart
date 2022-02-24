import 'package:shared_preferences/shared_preferences.dart';
import '/ui/dashboard/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/model/login_pass_model.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class LoginWithPassViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginPassModel loginPassModel = LoginPassModel();

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
  }

  // Login With Password
  loginWithPassword(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
      'password': password.text,
      'source_id': '1',
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/studentlogin"),
          body: params);
      if (response.statusCode == 200) {
        loginPassModel = LoginPassModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        getAndSaveToken(context);
        flutterToast(loginPassModel.message, Colors.green);
        AppRoutes.dismiss(context);
        AppRoutes.goto(context, const DashboardScreen());
      }
    } catch (e) {
      print("Exception in Login API $e");
    }
  }

  // Set Token on Login
  getAndSaveToken(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', loginPassModel.token);
    print("Shared Preference Token ------ ${prefs.getString("token")}");
  }
}
