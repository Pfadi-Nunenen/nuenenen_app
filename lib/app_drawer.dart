import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class AppDrawer extends StatefulWidget {
	@override
	_AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>{
	@override
	Widget build(BuildContext context) {
		return new Container(
			width: MediaQuery.of(context).size.width - 50,
			child: new Scaffold(
				bottomNavigationBar: new SafeArea(
					child: Container(
							color: null,
							height: 135.0,
							padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
							child: new Column(
								mainAxisAlignment: MainAxisAlignment.end,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>[
									new Image.asset(
										'images/wblogo.png',
										height: 35.0,
									),
									new Padding(padding: EdgeInsets.all(12.0)),
								],
							)
					),
				),
				backgroundColor: currBackgroundColor,
				body: new SingleChildScrollView(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
							new UserAccountsDrawerHeader(
								accountName: new Text(
									"",
									style: TextStyle(
											fontSize: 25.0,
											color: Colors.white,
											fontFamily: "Product Sans",
											fontWeight: FontWeight.bold
									),
								),
								accountEmail: new Text(
									"",
									style: TextStyle(
										fontSize: 15.0,
										color: Colors.white,
										fontFamily: "Product Sans",
									),
								),
								currentAccountPicture: new Container(
									padding: EdgeInsets.all(8.0),
									child: new ClipOval(
										child: new Image.asset(
											'images/default-profile.png',
											fit: BoxFit.fill,
										),
									),
								),
//                decoration: new BoxDecoration(
//                  image: new DecorationImage(
//                    fit: BoxFit.cover,
//                    image: new CachedNetworkImageProvider("http://vcrobotics.net/Page%20Media_PermanentOther/homerobotpicture2.jpg")
//                  )
//                ),
							),
							new Container(
								padding: EdgeInsets.all(8.0),
								child: new Column(
									children: <Widget>[
										new ListTile(
											title: new Text("", style: TextStyle(fontSize: 16.0, color: currTextColor)),
											leading: Icon(Icons.verified_user, color: currDividerColor,),
										),
									],
								),
							)
						],
					),
				),
			),
		);
	}
}