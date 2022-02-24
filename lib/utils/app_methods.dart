import '/ui/login_with_password/loginwithpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_route.dart';
import 'loading.dart';

flutterToast(String message, Color color) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

final loadingDialog = WillPopScope(
    onWillPop: () async {
      return true;
    },
    child: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), //this right here
      child: SizedBox(height: 300, width: 300, child: Loading(size: 300)),
    ));

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return loadingDialog;
    },
  );
}

logoutAlert(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  AppRoutes.makeFirst(context, const LoginWithPasswordScreen());
}
