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
  String fname = '';
  String lname = '';
  String password = '';
  DateTime student_dob = DateTime.now();
  String gender = '';
  String mobile = '';

  init(BuildContext context, String _fname, String _lname, String _password,
      DateTime _student_dob, String _gender, String _mobile) async {
    print("Add Photo Screen");
    fname = _fname;
    lname = _lname;
    password = _password;
    student_dob = _student_dob;
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

  // Register User
  registerUser(BuildContext context) async {
    // Convert Image to Base64
    Uint8List imagebytes = await imageFile!.readAsBytes();
    String base64string = base64.encode(imagebytes);

    //File Name
    String fileName = imageFile!.path.split('/').last.toString();

    Map<String, String> params = {
      'mobile': mobile,
      'fname': fname,
      'lname': lname,
      'password': password,
      'source_id': '1',
      'student_dob': "$student_dob",
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
      if (response.statusCode == 200) {
        print("Response ----- ${response.body}");
        RegisterModel registerModel =
            RegisterModel.fromJson(jsonDecode(response.body));
        print("res msg----- ${registerModel.message}");
        if (registerModel.message == "Password saved successfully") {
          flutterToast(registerModel.message, Colors.green);
          AppRoutes.dismiss(context);
          getAndSaveToken(context, registerModel.token);
          AppRoutes.goto(context, WelcomeScreen(name: fname));
        } else {
          Exception("Exception in Register API.");
        }
      }
    } catch (e) {
      Exception("Exception in registerUser API ---- $e");
    }
  }

  getAndSaveToken(BuildContext context, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Shared Preference Token ------ ${prefs.getString("token")}");
  }
}
