import '/ui/register/mobile_view_model.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import 'dart:io';

class AddPhotoScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String password;
  final DateTime datePicked;
  final String gender;
  final String mobile;
  final MobileViewModel viewModel;

  AddPhotoScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.datePicked,
    required this.gender,
    required this.mobile,
    required this.viewModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 4;
              viewModel.notifyListeners();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
          Center(
            child: Text(
              Constants.addPhotoOfYou,
              style: AppTextStyle.getStyle()
                  .openSansSemiBold!
                  .copyWith(fontSize: 22, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.black),
                image: DecorationImage(
                  image: FileImage(
                    File(viewModel.imageFile!.path),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomButton(
            callback: () => viewModel.getFromCamera(),
            title: Constants.takePhoto.toUpperCase(),
          ),
          const SizedBox(height: 20),
          CustomButton(
            callback: () => viewModel.getFromGallery(),
            title: Constants.chooseFromCameraRoll.toUpperCase(),
          ),
          const SizedBox(height: 30),
          Text(
            Constants.enterYourLocation,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(color: Colors.black, fontSize: 24),
          ),
          const SizedBox(height: 20),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Enter Location',
                hintStyle: AppTextStyle.getStyle()
                    .openSansSemiBold!
                    .copyWith(color: Colors.black)),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0XFF828687),
                    padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 500),
                          () => viewModel.registerUser(context));
                },
                child: Text(Constants.create.toUpperCase()),
              )
            ],
          )
        ],
      ),
    );
  }
}