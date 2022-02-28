import 'package:cynthi/ui/component/background_widget.dart';
import 'package:cynthi/utils/app_methods.dart';
import 'package:cynthi/utils/app_text_style.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import '/ui/add_photo/add_photo_screen.dart';
import '/ui/gender/widget/gender_widget.dart';
import 'package:flutter/material.dart';
import '/model/gender_model.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class GenderScreen extends StatefulWidget {
  GenderScreen(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.password});

  final String firstName;
  final String lastName;
  final String password;
  final String mobile;

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<GenderScreen> {
  String selectedGender = "";
  List<GenderModel> listGender = [];
  DateTime? datePicked;
  String gender = '';

  @override
  void initState() {
    listGender = [
      GenderModel(false, "Male"),
      GenderModel(false, "Female"),
      GenderModel(false, "Non-binary"),
      GenderModel(false, "Rather not say"),
    ];
    super.initState();
  }

  updateGenderList(GenderModel gender) {
    listGender.map((e) {
      if (e == gender) {
        setState(() {
          e.isSelected = true;
          selectedGender = "${e.title}";
        });
      } else {
        setState(() {
          e.isSelected = false;
          print(e.isSelected);
        });
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf6f2e7),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          if (gender.isEmpty || datePicked == null) {
            flutterToast("Please Select Gender/ Date", Colors.red);
          } else {
            AppRoutes.goto(
                context,
                AddPhotoScreen(
                    firstName: widget.firstName,
                    lastName: widget.lastName,
                    datePicked: datePicked!,
                    gender: gender,
                    password: widget.password,
                    mobile: widget.mobile));
          }
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.arrow_forward_ios),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => AppRoutes.dismiss(context),
        ),
      ),
      body: BackgroundWidget(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                      children: listGender.map((e) {
                        return GenderButtonWidget(
                          genderModel: e,
                          callback: () {
                            updateGenderList(e);
                            setState(() {
                              gender = e.title!;
                            });
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
                            dateWidget(datePicked == null
                                ? Constants.date
                                : "${datePicked!.day}"),
                            dateWidget(datePicked == null
                                ? Constants.month
                                : "${datePicked!.month}"),
                            dateWidget(datePicked == null
                                ? Constants.year
                                : "${datePicked!.year}"),
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
                        setState(() {
                          datePicked = datePick;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
