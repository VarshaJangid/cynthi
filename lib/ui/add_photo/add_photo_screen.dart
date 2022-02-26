import 'package:cynthi/utils/app_text_style.dart';

import '/ui/add_photo/add_photo_view_model.dart';
import 'package:stacked/stacked.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';
import 'dart:io';

class AddPhotoScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String password;
  final DateTime datePicked;
  final String gender;
  final String mobile;

  AddPhotoScreen({
    Key? key,
    required this.lastName,
    required this.firstName,
    required this.password,
    required this.gender,
    required this.datePicked,
    required this.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPhotoViewModel>.reactive(
      viewModelBuilder: () => AddPhotoViewModel(),
      onModelReady: (viewModel) => viewModel.init(
          context, firstName, lastName, gender, datePicked, password, mobile),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      Constants.addPhotoOfYou,
                      style: AppTextStyle.getStyle()
                          .openSansSemiBold!
                          .copyWith(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30),
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
                    callback: () => viewModel.getFromGallery(),
                    title: Constants.takePhoto.toUpperCase(),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    callback: () => viewModel.getFromCamera(),
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
            ),
          ),
        );
      },
    );
  }
}