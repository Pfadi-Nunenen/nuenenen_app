import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class StufenPage extends StatefulWidget {
  @override
  _StufenPageState createState() => _StufenPageState();
}

class _StufenPageState extends State<StufenPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Stufen",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ),
        ];
      },
      body: Container(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          left: 16.0
        ),
        color: currCardColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.all(8.0)
              ),
              Card(
                color: currBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: const Text(
                        "Biberstufe",
                        style: TextStyle(
                          color: mainColor,
                          fontFamily: "Product Sans",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          "Biberstein",
                          style: TextStyle(
                            fontFamily: "Product Sans",
                            color: currTextColor
                          )
                      ),
                      trailing: const Icon(
                          Icons.navigate_next,
                          color: mainColor
                      ),
                      onTap: () {
                        router.navigateTo(context, '/biber',
                            transition: TransitionType.native);
                      },
                    ),
                    const Divider(
                        height: 0.0,
                        color: mainColor
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: currBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Wolfstufe",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans"
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Phönix",
                        style: TextStyle(
                            fontFamily: "Product Sans",
                            color: currTextColor
                        )
                      ),
                      trailing: const Icon(
                          Icons.navigate_next,
                          color: mainColor
                      ),
                      onTap: () {
                        router.navigateTo(context, '/wolf',
                            transition: TransitionType.native);
                      },
                    ),
                    const Divider(
                        height: 0.0,
                        color: mainColor
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: currBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Pfadistufe",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans"),
                      ),
                    ),
                    ListTile(
                      title: Text("Pfadis (Saturn & Aetna)",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor)),
                      trailing: const Icon(
                          Icons.navigate_next,
                          color: mainColor
                      ),
                      onTap: () {
                        router.navigateTo(context, '/aetna',
                            transition: TransitionType.native);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
