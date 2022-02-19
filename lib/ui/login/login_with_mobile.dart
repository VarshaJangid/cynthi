import 'package:cynthi/ui/register/register_screen.dart';

import '/ui/sign_up/sign_up_screen.dart';
import '/utils/app_route.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Cynthi'ans \n\nEnter your contact number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 315,
              child: Row(
                children: const [
                  SizedBox(
                    width: 55,
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: '+91',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 260,
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => AppRoutes.goto(context, const SignUpScreen()),
              child: Container(
                width: 300,
                height: 50,
                color: Color(0XFF08263d),
                child: const Center(
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => AppRoutes.goto(context, RegisterScreen()),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
