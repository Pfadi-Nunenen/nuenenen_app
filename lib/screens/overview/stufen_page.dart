import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class StufenPage extends StatefulWidget{
	@override
	_StufenPage createState() => _StufenPage();
}

class _StufenPage extends State<StufenPage> {
  bool _notifs = true;

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
                      child: new Text("Biberstufe", style: TextStyle(color: mainColor, fontFamily: "Product Sans", fontWeight: FontWeight.bold),),
                    ),
                    new ListTile(
                      title: new Text("Biberstein", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
                      trailing: new Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/biber', transition: TransitionType.native);
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
                      child: new Text("Wolfstufe", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans"),),
                    ),
                    new ListTile(
                      title: new Text("Phönix", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
                      trailing: new Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/wolf', transition: TransitionType.native);
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
                      child: new Text("Pfadistufe", style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontFamily: "Product Sans"),),
                    ),
                    new ListTile(
                      title: new Text("Aetna", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
                      trailing: new Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/aetna', transition: TransitionType.native);
                      },
                    ),
                    new Divider(height: 0.0, color: mainColor),
                    new ListTile(
                      title: new Text("Saturn", style: TextStyle(fontFamily: "Product Sans", color: currTextColor)),
                      trailing: new Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/saturn', transition: TransitionType.native);
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
