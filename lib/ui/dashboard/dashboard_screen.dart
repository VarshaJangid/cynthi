import 'package:cynthi/ui/knowlwdge_hub/knowledge_hub_screen.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    TabBarDemo(),
    Text(
      'Index 1: Planner',
    ),
    Text(
      'Index 2: Cyntest',
    ),
    Text(
      'Index 3: Setting',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
