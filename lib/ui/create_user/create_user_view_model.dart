import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateUserViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  init(BuildContext context) async {
    firstName.addListener(() => notifyListeners());
    lastName.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
    confirmPassword.addListener(() => notifyListeners());
  }


  bool _showPassword = false;
  bool get showPassword => _showPassword;

  //show Password
  togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }
}
