import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class SettingsPage extends StatefulWidget {
	@override
	_SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
	bool _notifs = true;

	@override
	Widget build(BuildContext context) {
		return NestedScrollView(
			headerSliverBuilder: (BuildContext context, bool isScrolled) {
				return [
					new CupertinoSliverNavigationBar(
						largeTitle: new Text(
							"Settings",
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
							new Card(
								color: currBackgroundColor,
								child: Column(
									children: <Widget>[
										new Container(
											child: new Column(
												children: <Widget>[
												],
											),
										)
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
											child: new Text("General", style: TextStyle(color: mainColor, fontFamily: "Product Sans", fontWeight: FontWeight.bold),),
										),
										new ListTile(
											title: new Text("About", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												router.navigateTo(context, '/about', transition: TransitionType.native);
											},
										),
										new Divider(height: 0.0, color: mainColor),
										new ListTile(
											title: new Text("Help", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
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
											child: new Text("Preferences", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans"),),
										),
										new SwitchListTile.adaptive(
											title: new Text("Push Notifications", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: _notifs,
											activeColor: mainColor,
											onChanged: (bool value) {
												setState(() {
													_notifs = value;
												});
											},
										),
										new Divider(height: 0.0, color: mainColor),
										new SwitchListTile.adaptive(
											title: new Text("Dark Mode", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: darkMode,
											activeColor: mainColor,
											onChanged: (bool value) {
												print("Dark Mode - $value");
												setState(() {
													darkMode = value;
													if (darkMode) {
														currCardColor = darkCardColor;
														currBackgroundColor = darkBackgroundColor;
														currTextColor = darkTextColor;
														currDividerColor = darkDividerColor;
//                          mainColor = darkAccentColor;
													}
													else {
														currCardColor = lightCardColor;
														currBackgroundColor = lightBackgroundColor;
														currTextColor = lightTextColor;
														currDividerColor = lightDividerColor;
//                          mainColor = lightAccentColor;
													}
												});
											},
										),
										new Divider(height: 0.0, color: mainColor),
										new SwitchListTile.adaptive(
											title: new Text("Dark Mode", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											value: offlineMode,
											activeColor: mainColor,
											onChanged: (bool value) {
												print("Offline Mode - $value");
												setState(() {
													offlineMode = value;
												});
											},
										),
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
											title: new Text("Report a Bug", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												launch("https://github.com/Team3256/myWB-flutter/issues");
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