import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String devicePlatform = "";
  String deviceName = "";

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      devicePlatform = "iOS";
    } else if (Platform.isAndroid) {
      devicePlatform = "Android";
    }
    deviceName = Platform.localHostname;
  }

  launchContributeUrl() async {
    const url = 'https://github.com/Vento-Nuenenen/nuenenen/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url kann nicht geöffnet werden.';
    }
  }

  launchGuidelinesUrl() async {
    const url = 'https://github.com/Vento-Nuenenen/nuenenen/wiki/Contributing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url kann nicht geöffnet werden.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: mainColor,
          //actionsForegroundColor: Colors.white,
          previousPageTitle: "Zurück",
          middle: Text(
            "Über die APP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: currCardColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Card(
                  color: currBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Gerät",
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: "Product Sans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("App Version",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: currTextColor)),
                        trailing: Text("$appVersion$appStatus",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                fontSize: 16.0,
                                color: currTextColor)),
                      ),
                      Divider(height: 0.0, color: mainColor),
                      ListTile(
                        title: Text("Gerätename",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: currTextColor)),
                        trailing: Text("$deviceName",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                fontSize: 16.0,
                                color: currTextColor)),
                      ),
                      Divider(height: 0.0, color: mainColor),
                      ListTile(
                        title: Text("Platform",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: currTextColor)),
                        trailing: Text("$devicePlatform",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                fontSize: 16.0,
                                color: currTextColor)),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Card(
                  color: currBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Eintwicklung",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Caspar Brenneisen v/o Vento",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: currTextColor)),
                        subtitle: Text("App Development",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: Colors.grey)),
                        onTap: () {
                          const url = 'https://github.com/Vento-Nuenenen';
                          launch(url);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(16.0)),
                Card(
                  color: currBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Contributing",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Sourcecode",
                            style: TextStyle(
                                fontFamily: "Product Sans",
                                color: currTextColor)),
                        trailing: Icon(Icons.navigate_next, color: mainColor),
                        onTap: () {
                          launchContributeUrl();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
