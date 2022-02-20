import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback callback;
  final String title;

  CustomButton({required this.callback, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: const Color(0XFF08263d)),
        onPressed: callback,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
