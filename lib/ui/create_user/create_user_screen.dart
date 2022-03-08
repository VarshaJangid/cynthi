import '/ui/create_user/create_user_field.dart';
import '/ui/register/mobile_view_model.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key, required this.viewModel}) : super(key: key);
  final MobileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 1;
              viewModel.notifyListeners();
            },
            icon:
                const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            Constants.cynthians,
            style: AppTextStyle.getStyle()
                .comfortaaBold!
                .copyWith(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            Constants.createYourAccount,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            Constants.createAnAccountToGetStarted,
            style: AppTextStyle.getStyle()
                .openSansRegular!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              SizedBox(
                width: 150,
                child: textField(
                    context, Constants.firstName, viewModel.firstName),
              ),
              const Spacer(),
              SizedBox(
                width: 150,
                child:
                    textField(context, Constants.lastName, viewModel.lastName),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CreateUserField(
            obscureText: !viewModel.showPassword,
            controller: viewModel.password,
            labelText: Constants.createPassword,
            isIcon: true,
            iconPressed: () => viewModel.togglePassVisibility(),
          ),
          const SizedBox(height: 30),
          CreateUserField(
            controller: viewModel.confirmPassword,
            labelText: Constants.confirmPassword,
            isIcon: true,
            iconPressed: () => viewModel.toggleConfirmPassVisibility(),
            obscureText: !viewModel.showConfirmPassword,
          ),
          const SizedBox(height: 30),
          CustomButton(
              title: Constants.next,
              callback: () {
                viewModel.genderScreen(context);
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: RichText(
              text: TextSpan(
                text: Constants.buCreatingAnAccount,
                style: AppTextStyle.getStyle().openSansRegular!.copyWith(
                      color: Colors.black,
                    ),
                children: [
                  TextSpan(
                    text: Constants.privacyPolicy,
                    style: AppTextStyle.getStyle().openSansBold!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(
    BuildContext context,
    String title,
    TextEditingController controller,
  ) =>
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .08,
        child: TextField(
          controller: controller,
          cursorColor: Colors.black,
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 33),
            labelText: title,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: const Color(0XFFf6f2e7),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
      );
}
