import 'package:cynthi/ui/explore/explore_screen.dart';
import 'package:cynthi/utils/app_route.dart';
import 'package:cynthi/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';

class CythiansScreen extends StatelessWidget {
  const CythiansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.25,
                      child: const Text(
                        "Masterclass LIVE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => AppRoutes.goto(context, ExploreScreen()),
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.s17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0XFF08263d),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        "Today",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Text(
                        "Sort By",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  cythiansWidget(context),
                  cythiansWidget(context),
                  cythiansWidget(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget cythiansWidget(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFFeaf2f6),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.sad),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: const Text(
                            "IAS, Ketki Sharma\nBatch 1999,\nKanpur",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "01:30 PM - 02:30 PM",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "How to prepare for\nUPSC Entrance\nexam",
                          style: TextStyle(
                              color: Color(0XFF446481),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Text(
                              Constants.topicsCovered,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.info_outline,
                              size: 16,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 120,
                right: 110,
                bottom: -12 * 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      Constants.bookNow,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "96%",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Share.share('check out my website www.cynthians.com',
                        subject: 'Look what I made!');
                  },
                  child: Row(
                    children: [
                      Image.asset(Assets.share),
                      const SizedBox(width: 5),
                      const Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
}
