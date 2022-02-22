import 'package:cynthi/model/register_model.dart';
import 'package:image_picker/image_picker.dart';

import '/model/login_with_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '/utils/app_methods.dart';
import 'dart:convert';
import 'dart:io';

class AddPhotoViewModel extends BaseViewModel {
  File? imageFile = File("");
  String fname = '';
  String lname = '';
  String password = '';
  DateTime student_dob = DateTime.now();
  String gender = '';

  init(BuildContext context, String _fname, String _lname, String _password,
      DateTime _student_dob, String _gender) async {
    fname = _fname;
    lname = _lname;
    password = _password;
    student_dob = _student_dob;
    gender = _gender;
  }

  getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Register User
  registerUser() async {
    Map<String, String> params = {
      'mobile': '7619782948',
      'fname': "fname",
      'lname': "lname",
      'password': "12345678",
      'source_id': '2',
      'student_dob': "12/02/1999",
      'gender': "gender",
      'profilepicurl': 'profilePicUrl',
      'file_name': 'fileNAme',
    };
    final response = await http.post(
        Uri.parse(
            "https://api.cynthians.com/index.php/api/save_newstudentPassword"),
        body: params);
    if (response.statusCode == 200) {
      RegisterModel registerModel =
          RegisterModel.fromJson(jsonDecode(response.body));
      // 7619782948 I/flutter (16838): {"status":"success","message":"Password saved successfully","token":"xPn0uZ5cNpabOzoH"}
      print("Token is ---- ${registerModel.token}");
      if (registerModel.message == "Password saved successfully") {
        flutterToast("Password saved successfully.", Colors.green);
      } else {
        Exception("Exception in Register API.");
      }
    }
  }
}