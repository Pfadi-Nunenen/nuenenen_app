import 'package:flutter/cupertino.dart';
import 'package:nuenenen/user_info.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class AboutPage extends StatefulWidget {
	@override
	_AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
	String devicePlatform = "";
	String deviceName = "";

	List<String> betaTestersList = new List();

	@override
	void initState() {
		super.initState();
		if (Platform.isIOS) {
			devicePlatform = "iOS";
		}else if(Platform.isAndroid){
			devicePlatform = "Android";
		}
		deviceName = Platform.localHostname;
	}

	launchContributeUrl() async {
		const url = 'https://github.com/Team3256/myWB-flutter/';
		if (await canLaunch(url)) {
			await launch(url);
		} else {
			throw 'Could not launch $url';
		}
	}

	launchGuidelinesUrl() async {
		const url = 'https://github.com/Team3256/myWB-flutter/wiki/Contributing';
		if (await canLaunch(url)) {
			await launch(url);
		} else {
			throw 'Could not launch $url';
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				appBar: CupertinoNavigationBar(
					backgroundColor: mainColor,
					actionsForegroundColor: Colors.white,
					previousPageTitle: "Settings",
					middle: new Text(
						"Über die APP",
						style: TextStyle(
								color: Colors.white
						),
					),
				),
				backgroundColor: currCardColor,
				body: new SafeArea(
					child: SingleChildScrollView(
						padding: EdgeInsets.all(16.0),
						child: Column(
							children: <Widget>[
								new Card(
									color: currBackgroundColor,
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											new Container(
												padding: EdgeInsets.all(16.0),
												child: new Text("Device", style: TextStyle(
														color: mainColor,
														fontFamily: "Product Sans",
														fontWeight: FontWeight.bold),),
											),
											new ListTile(
												title: new Text("App Version",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												trailing: new Text("$appVersion$appStatus",
														style: TextStyle(
																fontFamily: "Product Sans", fontSize: 16.0, color: currTextColor)),
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("Device Name",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												trailing: new Text("$deviceName", style: TextStyle(
														fontFamily: "Product Sans", fontSize: 16.0, color: currTextColor)),
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("Platform",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												trailing: new Text("$devicePlatform", style: TextStyle(
														fontFamily: "Product Sans", fontSize: 16.0, color: currTextColor)),
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
												child: new Text("Credits", style: TextStyle(
														fontFamily: "Product Sans",
														color: mainColor,
														fontWeight: FontWeight.bold),),
											),
											new ListTile(
												title: new Text("Bharat Kathi",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												subtitle: new Text("App Development",
														style: TextStyle(fontFamily: "Product Sans", color: Colors.grey)),
												onTap: () {
													const url = 'https://github.com/bk1031';
													launch(url);
												},
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("John Panos",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												subtitle: new Text("Database Architecture",
														style: TextStyle(fontFamily: "Product Sans", color: Colors.grey)),
												onTap: () {
													const url = 'https://github.com/johnpanos';
													launch(url);
												},
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("Marc Liu",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												subtitle: new Text("Initial App Design",
														style: TextStyle(fontFamily: "Product Sans", color: Colors.grey)),
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("Kashyap Chaturvedula",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											),
											new ListTile(
												title: new Text("Samuel Stephen",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											),
											new ListTile(
												title: new Text("Flaumbert Ruas",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											),
											new ListTile(
												title: new Text("Bobby Daigle",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											),
											new ListTile(
												subtitle: new Text("Beta Testers\n",
														style: TextStyle(fontFamily: "Product Sans", color: Colors.grey)),
											),
										],
									),
								),
								new Padding(padding: EdgeInsets.all(16.0)),
								new Card(
									color: currBackgroundColor,
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											new Container(
												padding: EdgeInsets.all(16.0),
												child: new Text("Contributing", style: TextStyle(
														fontFamily: "Product Sans",
														color: mainColor,
														fontWeight: FontWeight.bold),),
											),
											new ListTile(
												title: new Text("View on GitHub",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												trailing: new Icon(
														Icons.navigate_next, color: mainColor),
												onTap: () {
													launchContributeUrl();
												},
											),
											new Divider(height: 0.0, color: mainColor),
											new ListTile(
												title: new Text("Contributing Guidelines",
														style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
												trailing: new Icon(
														Icons.navigate_next, color: mainColor),
												onTap: () {
													launchGuidelinesUrl();
												},
											),
										],
									),
								),
							],
						),
					),
				)
		);
	}
}