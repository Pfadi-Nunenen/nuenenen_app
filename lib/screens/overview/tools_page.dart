import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';

class ToolsPage extends StatefulWidget {
  @override
  _ToolsPage createState() => _ToolsPage();
}

class _ToolsPage extends State<ToolsPage> {
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
                        "QR Code Reader",
                        style: TextStyle(
                            color: mainColor,
                            fontFamily: "Product Sans",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text("QR Code Reader",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/qr-reader',
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
                        "Digitales Gästebuch",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Product Sans"),
                      ),
                    ),
                    ListTile(
                      title: Text("Digitales Gästebuch",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/guestbook',
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
