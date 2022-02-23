import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  bool? isIcon;
  TextEditingController? controller;

  AppTextField({required this.labelText, this.isIcon = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        autocorrect: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.only(left: 50),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: Icon(
            Icons.visibility_off,
            size: 20,
            color: isIcon == true ? Colors.black : Colors.transparent,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
