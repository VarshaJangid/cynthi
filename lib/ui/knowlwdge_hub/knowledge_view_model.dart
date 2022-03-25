import 'package:cynthi/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/model/register_model.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';
import 'dart:io';

class KnowledgeViewModel extends BaseViewModel {
  File? imageFile = File("");
  ProfileModel? profileModel;

  init(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () => masterClassLive(context));
    Future.delayed(Duration(milliseconds: 1000), () => studentData(context));
  }

  studentData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    Map<String, String> params = {
      'token': token!,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/getstudentdetails"),
          body: params);
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        AppRoutes.dismiss(context);
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      Exception("Exception in Login API $e");
    }
  }

  masterClassLive(BuildContext context) async {
    try {
      showLoadingDialog(context);
      final response = await http.get(
        Uri.parse("https://codevweb.com/demo/api/masterclasslive"),
      );

      if (response.statusCode == 200) {
        print("res ---- ${response.body}");
        notifyListeners();
        AppRoutes.dismiss(context);
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      Exception("Exception in Login API $e");
    }
  }
}
