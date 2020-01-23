import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class SettingsPage extends StatefulWidget {
	@override
	_SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
	FirebaseMessaging _firebaseMessaging =  FirebaseMessaging();

	bool darkMode = false;
	bool allowBiberNotification = false;
	bool allowWolfNotification = false;
	bool allowAetnaNotification = false;
	bool allowSaturnNotification = false;
	bool allowDevNotification = false;

	savePref(String key, bool value) async {
		final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
		sharedPrefs.setBool(key, value);
	}

	restorePref() async {
		final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
		setState(() {
			darkMode = (sharedPrefs.getBool('darkMode') ?? false);
			allowBiberNotification = (sharedPrefs.getBool('biberNot') ?? false);
			allowWolfNotification = (sharedPrefs.getBool('wolfNot') ?? false);
			allowAetnaNotification = (sharedPrefs.getBool('aetnaNot') ?? false);
			allowSaturnNotification = (sharedPrefs.getBool('saturnNot') ?? false);
			allowDevNotification = (sharedPrefs.getBool('devNot') ?? false);
		});
	}

	setNotificationChannel(String channelKey, bool state, String what){
		if(state == true){
			_firebaseMessaging.subscribeToTopic(channelKey);
			Fluttertoast.showToast(msg: "Benachrichtigungen welche ${what} betreffen werden nun angezeigt!");
		}else if(state == false){
			_firebaseMessaging.unsubscribeFromTopic(channelKey);
			Fluttertoast.showToast(msg: "Benachrichtigungen welche ${what} betreffen werden nicht mehr angezeigt!");
		}else{
			print("WTF have you done? This is impossible...");
		}
	}

	@override
	void initState() {
		super.initState();
		restorePref();
	}


	@override
	Widget build(BuildContext context) {
		return NestedScrollView(
			headerSliverBuilder: (BuildContext context, bool isScrolled) {
				return [
					new CupertinoSliverNavigationBar(
						largeTitle: new Text(
							"Einstellungen",
							style: TextStyle(
									color: Colors.white
							),
						),
						backgroundColor: mainColor,
					),
				];
			},
			body: new Container(
				padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
				color: currCardColor,
				child: new SingleChildScrollView(
					child: new Column(
						children: <Widget>[
							new Padding(padding: EdgeInsets.all(8.0)),
							new Card(
								color: currBackgroundColor,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										new Container(
											padding: EdgeInsets.all(16.0),
											child: new Text("Allgemeines", style: TextStyle(color: mainColor, fontFamily: "Product Sans", fontWeight: FontWeight.bold),),
										),
										new ListTile(
											title: new Text("Über die APP", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												router.navigateTo(context, '/about', transition: TransitionType.native);
											},
										),
										new Divider(height: 0.0, color: mainColor),
										new ListTile(
											title: new Text("Hilfe", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												router.navigateTo(context, '/help', transition: TransitionType.native);
											},
										),
										new Divider(height: 0.0, color: mainColor),
									],
								),
							),
							new Padding(padding: EdgeInsets.all(8.0)),
							new Card(
								color: currBackgroundColor,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										new Container(
											padding: EdgeInsets.all(16.0),
											child: new Text("Konfuguration", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans"),),
										),
										new SwitchListTile.adaptive(
											title: new Text("Dunkles Design", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: darkMode,
											activeColor: mainColor,
											onChanged: (bool value) {
												print("Dark Mode - $value");
												setState((){
													if (darkMode) {
														currCardColor = darkCardColor;
														currBackgroundColor = darkBackgroundColor;
														currTextColor = darkTextColor;
														currDividerColor = darkDividerColor;
//                          mainColor = darkAccentColor;
													}else{
														currCardColor = lightCardColor;
														currBackgroundColor = lightBackgroundColor;
														currTextColor = lightTextColor;
														currDividerColor = lightDividerColor;
//                          mainColor = lightAccentColor;
													}
													darkMode = value;
													savePref('darkMode', value);
												});
											},
										),
										new Divider(height: 5.0, color: mainColor, thickness: 2.0,),
										new SwitchListTile.adaptive(
											title: new Text("Benachrichtigungen Biber", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: allowBiberNotification,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													allowBiberNotification = value;
												});
												savePref('biberNot', value);
												setNotificationChannel('biber', value, 'die Familie Biberstein');
											},
										),
										new SwitchListTile.adaptive(
											title: new Text("Benachrichtigungen Wölf", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: allowWolfNotification,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													allowWolfNotification = value;
												});
												savePref('wolfNot', value);
												setNotificationChannel('wolf', value, 'die Meute Phönix');
											},
										),
										new SwitchListTile.adaptive(
											title: new Text("Benachrichtigungen Aetna", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: allowAetnaNotification,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													allowAetnaNotification = value;
												});
												savePref('aetnaNot', value);
												setNotificationChannel('aetna', value, 'den Stamm Aetna');
											},
										),
										new SwitchListTile.adaptive(
											title: new Text("Benachrichtigungen Saturn", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: allowSaturnNotification,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													allowSaturnNotification = value;
												});
												savePref('saturnNot', value);
												setNotificationChannel('saturn', value, 'den Trupp Saturn');
											},
										),
										new Divider(height: 5.0, color: mainColor, thickness: 1.0,),
										new SwitchListTile.adaptive(
											title: new Text("**Benachrichtigungen Test**", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: allowDevNotification,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													allowDevNotification = value;
												});
												savePref('devNot', value);
												setNotificationChannel('devel', value, 'die APP-Programmierer');
											},
										),
										new Divider(height: 0.0, color: mainColor),
									],
								),
							),
							new Padding(padding: EdgeInsets.all(8.0)),
							new Card(
								color: currBackgroundColor,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										new Container(
											padding: EdgeInsets.all(16.0),
											child: new Text("Feedback", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans",),),
										),
										new ListTile(
											title: new Text("Einen Fehler melden", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												launch("https://github.com/Vento-Nuenenen/nuenenen/issues");
											},
										),
									],
								),
							),
							new Padding(padding: EdgeInsets.all(8.0)),
						],
					),
				),
			),
		);
	}
}