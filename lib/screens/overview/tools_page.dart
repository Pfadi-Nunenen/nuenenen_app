import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class ToolsPage extends StatefulWidget{
	@override
	_ToolsPage createState() => _ToolsPage();
}

class _ToolsPage extends State<ToolsPage> {
	@override
	Widget build(BuildContext context) {
		return NestedScrollView(
			headerSliverBuilder: (BuildContext context, bool isScrolled) {
				return [
					new CupertinoSliverNavigationBar(
						largeTitle: new Text(
							"Stufen",
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
											child: new Text("QR Code Reader", style: TextStyle(color: mainColor, fontFamily: "Product Sans", fontWeight: FontWeight.bold),),
										),
										new ListTile(
											title: new Text("QR Code Reader", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												router.navigateTo(context, '/qr-reader', transition: TransitionType.native);
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
											child: new Text("Digitales Gästebuch", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans"),),
										),
										new ListTile(
											title: new Text("Digitales Gästebuch", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
											trailing: new Icon(Icons.navigate_next, color: mainColor),
											onTap: () {
												router.navigateTo(context, '/guestbook', transition: TransitionType.native);
											},
										),
										new Divider(height: 0.0, color: mainColor),
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
