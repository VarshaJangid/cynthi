import 'package:cynthi/ui/welcome/welcome_screen.dart';
import 'package:image_picker/image_picker.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';
import 'dart:io';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhotoScreen> {
  File? imageFile = File("");

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                        File(imageFile!.path),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                callback: () => _getFromCamera(),
                title: Constants.takePhoto.toUpperCase(),
              ),
              const SizedBox(height: 20),
              CustomButton(
                callback: () => _getFromGallery(),
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
                    onPressed: () => AppRoutes.goto(context, WelcomeScreen()),
                    child: Text(Constants.create.toUpperCase()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
