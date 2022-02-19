import 'package:cynthi/utils/app_route.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => AppRoutes.dismiss(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reset your Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your new password must be different from previous used passwords",
              style: TextStyle(fontSize: 23, color: Colors.grey),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 50,
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Create Password',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    suffixIcon: const Icon(Icons.visibility_off)),
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              height: 50,
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    suffixIcon: const Icon(Icons.visibility_off)),
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 300,
                height: 50,
                color: const Color(0XFF08263d),
                child: const Center(
                  child: Text(
                    "RESET PASSWORD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: const TextSpan(
                  text: 'By creating an account, you agree to our  ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
