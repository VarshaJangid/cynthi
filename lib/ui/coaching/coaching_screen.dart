import '/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CoachingScreen extends StatelessWidget {
  const CoachingScreen({Key? key}) : super(key: key);

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
            // height: 50,
            child: Row(
              children: const [],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0XFF08263d),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  coachingWidget(),
                  coachingWidget(),
                  coachingWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget coachingWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            padding: const EdgeInsets.all(10),
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
                    const Text(
                      "IAS, Ketki Sharma\nBatch 1999,\nKanpur",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
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
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "How to prepare for\nUPSC Entrance\nexam",
                      style: TextStyle(
                          color: Color(0XFF446481),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Start Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
}
