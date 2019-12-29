import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';

class HomePage extends StatefulWidget {
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	@override
	Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
	    body: Container(
		    color: currBackgroundColor,
		    child: new Center(
			    child: new Text(
				    "This will become the News-Section",
				    style: TextStyle(color: currTextColor),
			    ),
		    ),
	    ),
    );
  }
}