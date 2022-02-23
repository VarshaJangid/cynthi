import 'package:flutter/material.dart';
import '/utils/app_constant.dart';

class LoginTextField extends StatelessWidget {
  TextEditingController? controller;

  LoginTextField({Key? key, this.controller}) : super(key: key);

  TextStyle style = const TextStyle(color: Colors.black, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 51.8,
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              "   +91  ",
              style: style,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 120,
          height: 51.8,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20),
              border: InputBorder.none,
              hintText: Constants.mobileNumber,
              hintStyle: style,
            ),
          ),
        ),
      ],
    );
  }
}
