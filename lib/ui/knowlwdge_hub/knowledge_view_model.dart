import '/model/master_class_list_model.dart';
import '/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';
import 'dart:io';

class KnowledgeViewModel extends BaseViewModel {
  File? imageFile = File("");
  ProfileModel? profileModel;
  MasterClassListModel? listModel;

  init(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 500), () => masterClassLive(context));
    Future.delayed(
        const Duration(milliseconds: 1000), () => studentData(context));
  }

  masterClassLive(BuildContext context) async {
    try {
      showLoadingDialog(context);
      final response = await http.get(
        Uri.parse("https://codevweb.com/demo/api/masterclasslive"),
      );

      if (response.statusCode == 200) {
        print("res ---- ${response.body}");
        listModel = MasterClassListModel.fromJson(jsonDecode(response.body));
        print("Length is ---- ${listModel!.listMasterClassModelList.length}");
        notifyListeners();
        AppRoutes.dismiss(context);
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      Exception("Exception in Login API $e");
    }
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

  // Book Now
  bookNow(BuildContext context, String lactureId, String transactionId,
      String amount, String status, String studentId) async {
    Map<String, String> params = {
      'lacture_id': "1",
      'transaction_id': "21",
      'amount': "250",
      'status': "1",
      'student_id': "1",
    };
    try {
      final response = await http.post(
          Uri.parse("https://codevweb.com/demo/api/booklacture"),
          body: params);
      if (response.statusCode == 200) {
        final valur = jsonDecode(response.body);
        notifyListeners();
        if (valur == "Your Lacture Have been successfully Booked") {
          flutterToast(valur, Colors.green);
        } else {
          flutterToast(valur, Colors.redAccent);
        }
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      Exception("Exception in Login API $e");
    }
  }
}
