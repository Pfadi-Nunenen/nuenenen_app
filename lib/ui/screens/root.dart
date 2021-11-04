import 'dart:io';

import 'package:nuenenen_app/providers/audio_provider.dart';
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
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/root';

  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late Future futureData;
  int _selectedIndex = 0;
  late AudioProvider audio;

  static const List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();

    audio = context.read()..init();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            CupertinoTabScaffold(
              tabBuilder: (_, index) {
                return CupertinoTabView(builder: (_) => _widgetOptions[index]);
              },
              tabBar: CupertinoTabBar(
                backgroundColor: Colors.black12,
                iconSize: 24,
                activeColor: Colors.white,
                border: Border(top: Divider.createBorderSide(context)),
                items: const <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.house_fill),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.search),
                    label: 'Search',
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.music_albums_fill),
                    label: 'Library',
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
        MethodChannel('dev.koel.app').invokeMethod('minimize');
        return false;
      },
    );
  }
}
