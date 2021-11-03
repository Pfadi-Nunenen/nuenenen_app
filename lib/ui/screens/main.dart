import 'dart:io';

import 'package:nuenenen_app/ui/screens/home.dart';
import 'package:nuenenen_app/ui/screens/library.dart';
import 'package:nuenenen_app/ui/screens/search.dart';
import 'package:nuenenen_app/ui/widgets/footer_player_sheet.dart';
import 'package:flutter/cupertino.dart'
    show
        CupertinoIcons,
        CupertinoTabBar,
        CupertinoTabScaffold,
        CupertinoTabView;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future futureData;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            CupertinoTabScaffold(
              tabBuilder: (_, index) {
                return CupertinoTabView(builder: (_) {
                  return _widgetOptions[index];
                });
              },
              tabBar: CupertinoTabBar(
                backgroundColor: Colors.black12,
                iconSize: 24,
                activeColor: Colors.white,
                border: Border(top: Divider.createBorderSide(context)),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.house_fill),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search),
                    label: 'Stufen',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.music_albums_fill),
                    label: 'Einstellungen',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
            Positioned(
              // 50 is the standard iOS (10) tab bar height.
              bottom: 50 + MediaQuery.of(context).padding.bottom,
              width: MediaQuery.of(context).size.width,
              child: const FooterPlayerSheet(),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        if (!Platform.isAndroid || Navigator.of(context).canPop()) return true;
        const MethodChannel('ch.pfadi_nuenenen.app').invokeMethod('minimize');
        return false;
      },
    );
  }
}
