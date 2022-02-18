import 'package:cynthi/ui/login/login_with_mobile.dart';
import 'package:cynthi/utils/app_assets.dart';
import 'package:cynthi/utils/app_route.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Container(
            height: size.height * 0.8,
            child: PageView.builder(
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
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingData.length,
                  (index) => Container(
                margin: EdgeInsets.only(right: 15),
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          TextButton(onPressed: (){
            AppRoutes.goto(context, LoginScreen());
          }, child: Text("Click"))
        ],
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black54,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          Assets.sad,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        Divider(
          thickness: 2.0,
          color: Colors.black,
          endIndent: size.width * 0.4,
          indent: size.width * 0.4,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          "Try to focus on your project idea,\nthinking about the goal you\nwant to achieve.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}