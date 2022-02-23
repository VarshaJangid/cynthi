import '/ui/login_with_password/loginwithpassword_screen.dart';
import '/ui/register/mobile_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';
import '/utils/app_route.dart';
import 'dart:async';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  List<Map<String, String>> onBoardingData = [
    {
      "image": "assets/images/image1.png",
      "title": "Think about your idea",
    },
    {
      "image": "assets/images/image2.png",
      "title": "Share your thoughts",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Realize your project",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Realize your project",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: const Color(0XFF08263d),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => Content(
                  size: size,
                  image: onBoardingData[index]["image"]!,
                  // text: onBoardingData[index]["text"]!,
                  title: onBoardingData[index]["title"]!,
                ),
              ),
            ),
            // SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: currentPage == index ? 20 : 13,
                  width: currentPage == index ? 20 : 13,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.white : Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            // SizedBox(height: size.height * 0.03),
            TextButton(
              onPressed: () =>
                  AppRoutes.goto(context, const LoginWithPasswordScreen()),
              child: RichText(
                text: const TextSpan(
                  text: Constants.alreadyHaveAccount,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: Constants.login,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
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

class Content extends StatelessWidget {
  const Content({
    required this.size,
    this.text = '',
    this.image = '',
    this.title = '',
  });

  final Size size;
  final String text, image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF08263d),
      child: Column(
        children: [
          // const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Image.asset(Assets.logo, width: 100, height: 100, fit: BoxFit.fill),
          const SizedBox(height: 20),
          const Text(
            "Cynthi’ans",
            style: TextStyle(
                color: Colors.white, fontSize: 33, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30),
          Image.asset(Assets.onboarding,
              width: 120, height: 120, fit: BoxFit.fill),
          const SizedBox(height: 10),
          const Text(
            Constants.welcomeText,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => AppRoutes.goto(context, const MobileScreen()),
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              color: Colors.white,
              height: 50,
              child: const Center(
                child: Text(
                  "LET'S GET STARTED",
                  style: TextStyle(color: Color(0XFF08263d)),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          const Text(
            "This is a place to learn, plan & grow.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
