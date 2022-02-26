import 'package:cynthi/utils/app_text_style.dart';

import '/model/gender_model.dart';
import 'package:flutter/material.dart';

class GenderButtonWidget extends StatelessWidget {
  final GestureTapCallback callback;
  final GenderModel genderModel;

  GenderButtonWidget({required this.callback, required this.genderModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.5),
        child: Container(
          width: 124,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0XFFf9f0d6),
            border: Border.all(
                color: genderModel.isSelected == true
                    ? Colors.black
                    : const Color(0XFFf9f0d6),
                width: 2),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Center(
            child: Text(
              "${genderModel.title}",
              style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
