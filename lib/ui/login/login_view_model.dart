import 'package:flutter/material.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginViewModel  {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  void init(BuildContext context) {}

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  String verificationId = '';
  bool showLoading = false;


}