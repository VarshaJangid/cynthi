import 'package:cynthi/utils/app_text_style.dart';
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
        style: ElevatedButton.styleFrom(
            primary: const Color(0XFF08263d),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22))),
        onPressed: callback,
        child: Text(
          title,
          style: AppTextStyle.getStyle().openSansSemiBold,
        ),
      ),
    );
  }
}
