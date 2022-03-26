import 'package:cynthi/utils/razor_pay_details.dart';

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
import 'package:razorpay_flutter/razorpay_flutter.dart';

class KnowledgeViewModel extends BaseViewModel {
  File? imageFile = File("");
  ProfileModel? profileModel;
  MasterClassListModel? listModel;
  Razorpay? _razorpay;
  String? transactionId;
  bool data = false;

  init(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 500), () => masterClassLive(context));
    Future.delayed(
        const Duration(milliseconds: 1000), () => studentData(context));
    //RazorPay
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("_handlePaymentSuccess $response");
    print("_handlePaymentSuccess ${response.paymentId}");
    transactionId = response.paymentId;
    notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    flutterToast(
        "Transaction Failed" +
            response.code.toString() +
            " - " +
            "${response.message}",
        Colors.redAccent);
    print("Transaction Failed ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    flutterToast("EXTERNAL_WALLET - ${response.walletName}", Colors.redAccent);
    print("EXTERNAL_WALLET ${response.walletName}");
  }

  openCheckout(int amount) async {
    try {
      var options = {
        'key': RazorPayDetails.rzpKeyTest,
        'amount': amount * 100,
        'name': "Name",
        'description': "Cynthi'ans",
        'prefill': {'contact': '+919969696969', 'email': 'test@gmail.com'},
      };
      _razorpay!.open(options);
    } catch (e) {
      Exception("Error in Razorpay details");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }
}
