import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/ui/welcome/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/model/register_model.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';
import 'dart:io';

class AddPhotoViewModel extends BaseViewModel {
  File? imageFile = File("");
  String firstName = '';
  String lastName = '';
  String password = '';
  DateTime datePicked = DateTime.now();
  String gender = '';
  String mobile = '';

  init(
      BuildContext context,
      String _firstName,
      String _lastName,
      String _password,
      DateTime _datePicked,
      String _gender,
      String _mobile) async {
    firstName = _firstName;
    lastName = _lastName;
    password = _password;
    datePicked = _datePicked;
    gender = _gender;
    mobile = _mobile;
  }

}
