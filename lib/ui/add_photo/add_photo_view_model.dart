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
      print("image ---- $imageFile");
    }
  }

  registerUser(BuildContext context) async {
    Uint8List imagebytes = await imageFile!.readAsBytes();
    String base64string = base64.encode(imagebytes);

    //File Name
    String fileName = imageFile!.path.split('/').last.toString();
    print("First name ---- $firstName");
    print("last name ---- $lastName");
    print("mobile ---- $mobile");
    print("password ---- $password");
    print("datepicked ---- $datePicked");
    print("gender ---- $gender");
    print("base64string ---- $base64string");
    print("fileName ---- $fileName");

    Map<String, String> params = {
      'mobile': mobile,
      'fname': firstName,
      'lname': lastName,
      'password': password,
      'source_id': '1',
      'student_dob': datePicked.toString().substring(0, 10),
      'gender': gender,
      'profilepicurl': base64string,
      'file_name': fileName,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/save_newstudentPassword"),
          body: params);
      print("--------------------------------");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print("Response ----- ${response.body}");
        RegisterModel registerModel =
            RegisterModel.fromJson(jsonDecode(response.body));
        print("res msg----- ${registerModel.message}");
        flutterToast(registerModel.message, Colors.green);
        AppRoutes.dismiss(context);
        getAndSaveToken(context, registerModel.token);
        AppRoutes.goto(context, WelcomeScreen(name: firstName));
      }
    } catch (e) {
      print("Exception in Login API $e");
    }
  }

  getAndSaveToken(BuildContext context, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Shared Preference Token ------ ${prefs.getString("token")}");
  }
}
