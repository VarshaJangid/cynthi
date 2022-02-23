import '/utils/auth.dart';
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

      auth.setUser(
        studentId: loginPassModel.studentId,
        firstName: "",
        lastName: "",
        mobileNo: loginPassModel.mobile,
        gender: "",
        token: loginPassModel.token,
      );

      auth.updateUserInSharedPrefs(
        loginPassModel.studentId,
        "",
        "",
        loginPassModel.mobile,
        "",
        loginPassModel.token,
      );

      auth.setUserFromPreference();
      print("Student Id ==========>>> ${auth.currentUser!.studentId}");
      print("Mobile ==========>>> ${auth.currentUser!.mobileNo}");
      print("Token ==========>>> ${auth.currentUser!.token}");

      flutterToast("Successfully Logged In !!!", Colors.green);
      //set auth
      AppRoutes.goto(context, const DashboardScreen());
    }
  }
}
