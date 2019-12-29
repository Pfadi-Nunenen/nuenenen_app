import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';

class PfadiPage extends StatefulWidget{
	@override
	_PfadiPage createState() => _PfadiPage();
}

class _PfadiPage extends State<PfadiPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
	  return NestedScrollView(
		  headerSliverBuilder: (BuildContext context, bool isScrolled){
			  return [
				  new CupertinoSliverNavigationBar(
					  largeTitle: new Text(
						  "Home",
						  style: TextStyle(
								  color: Colors.white
						  ),
					  ),
					  backgroundColor: mainColor,
				  ),
			  ];
		  },
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