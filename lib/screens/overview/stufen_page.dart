import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class StufenPage extends StatefulWidget {
  @override
  _StufenPage createState() => _StufenPage();
}

class _StufenPage extends State<StufenPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Stufen",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ),
        ];
      },
      body: Container(
        padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        color: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Biberstufe",
                        style: TextStyle(
                            color: mainColor,
                            fontFamily: "Product Sans",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text("Biberstein",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )
                      ),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/biber',
                            transition: TransitionType.native);
                      },
                    ),
                    Divider(height: 0.0, color: mainColor),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Wolfstufe",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Product Sans"),
                      ),
                    ),
                    ListTile(
                      title: Text("Phönix",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/wolf',
                            transition: TransitionType.native);
                      },
                    ),
                    Divider(height: 0.0, color: mainColor),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Pfadistufe",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Product Sans"),
                      ),
                    ),
                    ListTile(
                      title: Text("Aetna",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/aetna',
                            transition: TransitionType.native);
                      },
                    ),
                    Divider(height: 0.0, color: mainColor),
                    ListTile(
                      title: Text("Saturn",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/saturn',
                            transition: TransitionType.native);
                      },
                    ),
                    Divider(height: 0.0, color: mainColor),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),
        ),
      ),
    );
  }
}
