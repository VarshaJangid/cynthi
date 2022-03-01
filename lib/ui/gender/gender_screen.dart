import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import '/ui/gender/widget/gender_widget.dart';
import '/ui/register/mobile_view_model.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.viewModel,
      required this.password});

  final String firstName;
  final String lastName;
  final String password;
  final String mobile;
  final MobileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 3;
              viewModel.notifyListeners();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
          Text(
            Constants.pleaseSelectYourGender,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 30),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 20,
            children: viewModel.listGender.map((e) {
              return GenderButtonWidget(
                genderModel: e,
                callback: () {
                  viewModel.updateGenderList(e);
                  // setState(() {
                  //   gender = e.title!;
                  // });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 50),
          Text(
            Constants.enterYourBirthDate,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dateWidget(viewModel.datePicked == null
                      ? Constants.date
                      : "${viewModel.datePicked!.day}"),
                  dateWidget(viewModel.datePicked == null
                      ? Constants.month
                      : "${viewModel.datePicked!.month}"),
                  dateWidget(viewModel.datePicked == null
                      ? Constants.year
                      : "${viewModel.datePicked!.year}"),
                ],
              ),
            ),
            onTap: () async {
              final datePick = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime(1994),
                firstDate: DateTime(1960),
                lastDate: DateTime(2012),
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: true,
              );
              viewModel.datePicked = datePick;
              viewModel.notifyListeners();
            },
          ),
        ],
      ),
    );
  }

  Widget dateWidget(String title) => Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0XFFf9f0d6),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(color: Colors.black, fontSize: 17),
          ),
        ),
      );
}
