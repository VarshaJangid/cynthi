import 'package:cynthi/ui/razorpay.dart';

import '/ui/knowlwdge_hub/knowledge_hub_screen.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import '/utils/dimensions.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  int _currentIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const TabBarDemo(),
    VarshaJangid(),
    const Text('Index 2: Cyntest'),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  popup() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: const Color(0XFF08263e),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _onItemTapped(value);
        },
        items: [
          BottomNavigationBarItem(
            title: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                Constants.knowledgeHub,
                style: TextStyle(fontSize: 10),
              ),
            ),
            icon: Image.asset(Assets.knowledge),
          ),
          BottomNavigationBarItem(
            title: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                Constants.planner,
                style: TextStyle(fontSize: 10),
              ),
            ),
            icon: Image.asset(Assets.planner),
          ),
          BottomNavigationBarItem(
            title: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                Constants.cyntest,
                style: TextStyle(fontSize: 10),
              ),
            ),
            icon: Image.asset(Assets.cyntest),
          ),
          BottomNavigationBarItem(
            title: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                Constants.setting,
                style: TextStyle(fontSize: 10),
              ),
            ),
            icon: Image.asset(Assets.setting),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              logOutPopup(
                  title: "title",
                  context: context,
                  subTitle: "subTitle",
                  image: Assets.logo);
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
      ),
    );
  }
}

void logOutPopup({
  required String title,
  required BuildContext context,
  required String subTitle,
  required String image,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: SizedBox(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.s65),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.s30)),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.s25),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text("Are you sure you want logout ?",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () => AppRoutes.dismiss(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => logoutAlert(context),
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Image.asset(
                    image,
                    height: Dimensions.s70 * 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        titlePadding: const EdgeInsets.all(0),
        elevation: 0,
        backgroundColor: Colors.transparent,
      );
    },
    barrierDismissible: false,
  );
}
