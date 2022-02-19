import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Cynthi'ans",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(height: 8),
            const Text(
              "Create your account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(height: 15),
            const Text(
              "Create an account to get started.",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle:
                          const TextStyle(color: Colors.grey, fontSize: 12),
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
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle:
                          const TextStyle(color: Colors.grey, fontSize: 12),
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
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Create Password',
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12),
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
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12),
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
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 300,
                height: 50,
                color: const Color(0XFF08263d),
                child: const Center(
                  child: Text(
                    "NEXT",
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
