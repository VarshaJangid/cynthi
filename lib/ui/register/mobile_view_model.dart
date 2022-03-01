import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:country_code_picker/country_code.dart';
import 'package:cynthi/model/gender_model.dart';
import 'package:cynthi/model/register_model.dart';
import 'package:cynthi/ui/add_photo/add_photo_screen.dart';
import 'package:cynthi/ui/gender/gender_screen.dart';
import 'package:cynthi/ui/register/mobile_screen.dart';
import 'package:cynthi/ui/welcome/welcome_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/ui/reset_password/reset_password_screen.dart';
import '/ui/create_user/create_user_screen.dart';
import '/ui/otp_verify/otp_verify_screen.dart';
import '/model/login_with_otp_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/model/user_exist_model.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class MobileViewModel extends BaseViewModel {
  //add photo
  File? imageFile = File("");

  //mobile
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  LoginWithOtpModel loginWithOtpModel = LoginWithOtpModel();

  //create User controller
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String otpSet = "";
  int currentIndex = 1;

  DateTime? datePicked;

  String selectedGender = "";
  List<GenderModel> listGender = [];

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());

    reset();
    startTimer();

//create User controller
    firstName.addListener(() => notifyListeners());
    lastName.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
    confirmPassword.addListener(() => notifyListeners());

    //gender List

    listGender = [
      GenderModel(false, "Male"),
      GenderModel(false, "Female"),
      GenderModel(false, "Non-binary"),
      GenderModel(false, "Rather not say"),
    ];
  }

//create User
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  //show Password
  togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  validation(BuildContext context) {
    if (mobileNumber.text.isEmpty || mobileNumber.text.length != 10) {
      flutterToast("Number is not valid !!", Colors.red);
    } else {
      Future.delayed(
          const Duration(microseconds: 500), () => loginWithOTP(context));
    }
  }

  String countryCode = "+91";

  void onCountryChange(CountryCode countryCode) {
    this.countryCode = countryCode.toString();
    notifyListeners();
    print("New Country selected: " + countryCode.toString());
  }

  // Login With OTP
  loginWithOTP(BuildContext context) async {
    print("Mobile Number is ------ ${countryCode + mobileNumber.text}");
    Map<String, String> params = {
      'mobile': countryCode + mobileNumber.text,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/send_otp_mobile"),
          body: params);
      if (response.statusCode == 200) {
        loginWithOtpModel =
            LoginWithOtpModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        otpSet = "${loginWithOtpModel.otp}";
        notifyListeners();
        print("value otp $otpSet");
        AppRoutes.dismiss(context);
        if (loginWithOtpModel.message == "OTP sent successfully.") {
          flutterToast(loginWithOtpModel.message, Colors.green);
          print("data");
          print(countryCode + mobileNumber.text);
          print(countryCode.toString() + mobileNumber.text);
          currentIndex = 2;
          notifyListeners();
          // AppRoutes.dismiss(context);
          // AppRoutes.goto(
          //     context,
          //     OtpVerifyScreen(
          //       mobileNumber: countryCode + mobileNumber.text,
          //       otp: "${loginWithOtpModel.otp}",
          //     ));
        } else {
          flutterToast(loginWithOtpModel.message, Colors.red);
        }
      } else {
        throw Exception('Exception in Login With OTP API');
      }
    } catch (e) {
      Exception("Exception in loginWithOTP API ----- $e");
    }
  }

  checkUserExist(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
    };
    showLoadingDialog(context);
    try {
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/check_newmobile_studlogin"),
          body: params);
      if (response.statusCode == 200) {
        print(response.statusCode);
        UserExistModel userExistModel =
            UserExistModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        if (userExistModel.loginType == 'exist') {
          //already exist
          flutterToast("You can reset your password.", Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(
              context, ResetPasswordScreen(mobileNumber: mobileNumber));
        } else {
          AppRoutes.dismiss(context);
          flutterToast("Please fill your details.", Colors.green);
          currentIndex = 3;
          // AppRoutes.goto(context, CreateUserScreen(mobile: mobileNumber));
        }
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }

  static const countdownDuration = Duration(seconds: 60);
  Duration duration = const Duration();
  Timer? timer;

  bool countDown = true;

  void reset() {
    if (countDown) {
      duration = countdownDuration;
      notifyListeners();
    } else {
      duration = const Duration();
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    notifyListeners();
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  otpVerify(
    BuildContext context,
  ) {
    // print("Otp is ------ ${viewModel.loginWithOtpModel.otp}");
    if (otpController.text == otpSet) {
      print("Mobile ---- $mobileNumber");
      checkUserExist(context, mobileNumber.text);
    } else {
      flutterToast("Wrong OTP !!!", Colors.red);
    }
  }

  Widget registerFlow() {
    return currentIndex == 1
        ? MobileScreen(
            viewModel: this,
          )
        : currentIndex == 2
            ? OtpVerifyScreen(
                mobileNumber: mobileNumber.text,
                otp: otpSet,
                viewModel: this,
              )
            : currentIndex == 3
                ? CreateUserScreen(
                    mobile: mobileNumber.text,
                    viewModel: this,
                  )
                : currentIndex == 4
                    ? GenderScreen(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        password: password.text,
                        mobile: mobileNumber.text,
                        viewModel: this,
                      )
                    : currentIndex == 5
                        ? AddPhotoScreen(
                            viewModel: this,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            password: password.text,
                            datePicked: datePicked!,
                            gender: selectedGender,
                            mobile: mobileNumber.text)
                        : Text("$currentIndex");
  }

  double getCompletionPercentage() {
    if (currentIndex == 0) {
      return 0;
    }
    return currentIndex / 5;
  }

  //genderScreen Model
  void genderScreen(BuildContext context) {
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      flutterToast("Please enter valid data !! ", Colors.red);
    } else {
      if (password.text == confirmPassword.text) {
        currentIndex = 4;
        notifyListeners();
      } else {
        flutterToast("Password does not match !!!", Colors.red);
      }
    }
  }

  //gender Model init
  updateGenderList(GenderModel gender) {
    listGender.map((e) {
      if (e == gender) {
        e.isSelected = true;
        selectedGender = "${e.title}";
        notifyListeners();
      } else {
        e.isSelected = false;
        print(e.isSelected);
        notifyListeners();
      }
    }).toList();
  }

  genderToNextScreen() {
    if (selectedGender.isEmpty || datePicked == null) {
      flutterToast("Please Select Gender/ Date", Colors.red);
    } else {
      currentIndex = 5;
      notifyListeners();
      // AppRoutes.goto(
      //     context,
      //     AddPhotoScreen(
      //         firstName: widget.firstName,
      //         lastName: widget.lastName,
      //         password: widget.password,
      //         datePicked: datePicked!,
      //         gender: gender,
      //         mobile: widget.mobile));
    }
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
    print("First name ---- ${firstName.text}");
    print("last name ---- ${lastName.text}");
    print("mobile ---- ${mobileNumber.text}");
    print("password ---- ${password.text}");
    print("datepicked ---- $datePicked");
    print("gender ---- $selectedGender");
    print("base64string ---- $base64string");
    print("fileName ---- $fileName");

    Map<String, String> params = {
      'mobile': mobileNumber.text,
      'fname': firstName.text,
      'lname': lastName.text,
      'password': password.text,
      'source_id': '1',
      'student_dob': datePicked.toString().substring(0, 10),
      'gender': selectedGender,
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
        AppRoutes.goto(context, WelcomeScreen(name: firstName.text));
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
