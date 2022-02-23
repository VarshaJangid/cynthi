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

  AddPhotoScreen({
    Key? key,
    required this.lastName,
    required this.firstName,
    required this.password,
    required this.gender,
    required this.datePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPhotoViewModel>.reactive(
      viewModelBuilder: () => AddPhotoViewModel(),
      onModelReady: (viewModel) => viewModel.init(
          context, firstName, lastName, gender, datePicked, password),
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
                  const Center(
                    child: Text(
                      Constants.addPhotoOfYou,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                    callback: () => viewModel.getFromCamera(),
                    title: Constants.takePhoto.toUpperCase(),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    callback: () => viewModel.getFromGallery(),
                    title: Constants.chooseFromCameraRoll.toUpperCase(),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    Constants.enterYourLocation,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Bhiwadi, Thane',
                        labelStyle: TextStyle(color: Colors.black)),
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
