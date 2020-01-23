import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';
import 'package:nuenenen/screens/home/home_page.dart';
import 'package:nuenenen/screens/overview/stufen_page.dart';
import 'package:nuenenen/screens/overview/tools_page.dart';
import 'package:nuenenen/screens/settings/settings_page.dart';

class TabBarController extends StatefulWidget{
	@override
	_TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>{
	FirebaseMessaging _firebaseMessaging =  FirebaseMessaging();

	int _currentTab = 0;
	String _title = "Home";
	Widget _currentWidget = new HomePage();
	Color tabBarColor = currBackgroundColor;

	void firebaseCloudMessaging_Listeners() {
		if (Platform.isIOS) iOS_Permission();
		_firebaseMessaging.configure(
			onMessage: (Map<String, dynamic> message) async {
				print('(APP is open) on message $message');
			},
			onResume: (Map<String, dynamic> message) async {
				print('on resume $message');
			},
			onLaunch: (Map<String, dynamic> message) async {
				print('on launch $message');
			},
		);
	}

	void iOS_Permission() {
		_firebaseMessaging.requestNotificationPermissions(
				IosNotificationSettings(sound: true, badge: true, alert: true)
		);
		_firebaseMessaging.onIosSettingsRegistered
				.listen((IosNotificationSettings settings)
		{
			print("Settings registered: $settings");
		});
	}

	void onTabTapped(int index) {
		lastPage = index;
		setState(() {
			tabBarColor = currBackgroundColor;
		});
		_currentTab = index;
		if (index == 0) {
			setState(() {
				_currentWidget = new HomePage();
				_title = "Home";
			});
		}else if (index == 1) {
			setState(() {
				_currentWidget = new StufenPage();
				_title = "Stufen";
			});
		}else if (index == 2) {
			setState(() {
				_currentWidget = new ToolsPage();
				_title = "Tools";
			});
		}else if (index == 3) {
			setState(() {
				_currentWidget = new SettingsPage();
				_title = "Einstellungen";
			});
		}
	}

	@override
	void initState() {
		super.initState();
		firebaseCloudMessaging_Listeners();

		setState(() {
			_currentTab = lastPage;
			if (lastPage == 0) {
				setState(() {
					_currentWidget = new HomePage();
					_title = "Home";
				});
			}else if (lastPage == 1) {
				setState(() {
					_currentWidget = new StufenPage();
					_title = "Stufen";
				});
			}else if (lastPage == 2) {
				setState(() {
					_currentWidget = new ToolsPage();
					_title = "Tools";
				});
			}else if (lastPage == 3) {
				setState(() {
					_currentWidget = new SettingsPage();
					_title = "Einstellungen";
				});
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: _currentWidget,
			backgroundColor: currBackgroundColor,
			bottomNavigationBar: new BottomNavigationBar(
				onTap: onTabTapped,
				currentIndex: _currentTab,
				showSelectedLabels: true,
				showUnselectedLabels: true,
				backgroundColor: tabBarColor,
				items: [
					new BottomNavigationBarItem(
							icon: new Icon(Icons.home, size: 30.0, color: Colors.grey,),
							activeIcon: new Icon(Icons.home, size: 30.0, color: mainColor),
							title: new Text("Home", style: TextStyle(color: Colors.grey),)
					),
					new BottomNavigationBarItem(
							icon: new Icon(Icons.info, size: 30.0, color: Colors.grey,),
							activeIcon: new Icon(Icons.info, size: 30.0, color: mainColor),
							title: new Text("Stufen", style: TextStyle(color: Colors.grey))
					),
					new BottomNavigationBarItem(
							icon: new Icon(Icons.build, size: 30.0, color: Colors.grey,),
							activeIcon: new Icon(Icons.build, size: 30.0, color: mainColor),
							title: new Text("Tools", style: TextStyle(color: Colors.grey))
					),
					new BottomNavigationBarItem(
							icon: new Icon(Icons.settings, size: 30.0, color: Colors.grey,),
							activeIcon: new Icon(Icons.settings, size: 30.0, color: mainColor),
							title: new Text("Einstellungen", style: TextStyle(color: Colors.grey))
					),
				],
			),
		);
	}
}