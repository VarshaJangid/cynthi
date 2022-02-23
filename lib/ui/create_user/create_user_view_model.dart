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
