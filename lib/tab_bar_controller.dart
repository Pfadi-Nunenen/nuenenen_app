import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/screens/overview/home_page.dart';
import 'package:nuenenen/user_info.dart';

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentTab = 0;
  String _title = "Home";
  Widget _currentWidget = HomePage();
  Color tabBarColor = currBackgroundColor;

  void onTabTapped(int index) {
    lastPage = index;

    setState(() {
      tabBarColor = currBackgroundColor;
    });

    _currentTab = index;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentWidget,
      backgroundColor: currBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentTab,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: tabBarColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 30.0,
              color: mainColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                size: 30.0,
                color: Colors.grey,
              ),
            activeIcon: Icon(
              Icons.info,
              size: 30.0,
              color: mainColor
            ),
            label: "Stufen"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30.0,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.settings,
              size: 30.0,
              color: mainColor,
            ),
            label: "Einstellungen"
          )
        ],
      ),
    );
  }
}
