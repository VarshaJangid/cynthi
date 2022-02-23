import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/ui/gender/gender_screen.dart';
import 'package:stacked/stacked.dart';
import 'create_user_view_model.dart';
import '/utils/app_constant.dart';
import '/utils/app_route.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateUserViewModel>.reactive(
      viewModelBuilder: () => CreateUserViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Constants.cynthians,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 8),
                const Text(
                  Constants.createYourAccount,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 15),
                const Text(
                  Constants.createAnAccountToGetStarted,
                  style: TextStyle(fontSize: 18, color: Color(0XFF666666)),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: textField(context, Constants.firstName),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: textField(context, Constants.lastName),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                textField(context, Constants.createPassword),
                const SizedBox(height: 40),
                textField(context, Constants.confirmPassword),
                const SizedBox(height: 40),
                CustomButton(
                  title: Constants.next,
                  callback: () => AppRoutes.goto(
                    context,
                    GenderScreen(
                      firstName: viewModel.firstName.text,
                      lastName: viewModel.lastName.text,
                      password: viewModel.password.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: RichText(
                    text: const TextSpan(
                      text: Constants.buCreatingAnAccount,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                            text: Constants.privacyPolicy,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget textField(BuildContext context, String title) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .08,
        child: TextField(
          cursorColor: Colors.black,
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 40),
            labelText: title,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white70,
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
