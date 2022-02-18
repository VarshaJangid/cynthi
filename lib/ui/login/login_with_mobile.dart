import 'package:cynthi/ui/sign_up/sign_up_screen.dart';
import 'package:cynthi/utils/app_assets.dart';
import 'package:cynthi/utils/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Cynthi'and \n\n Enter your contact number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                            TextStyle(color: Colors.black, fontSize: 12),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
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
                              TextStyle(color: Colors.black, fontSize: 12),
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
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                AppRoutes.goto(context, SignUpScreen());
              },
              child: Container(
                width: 300,
                height: 50,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
