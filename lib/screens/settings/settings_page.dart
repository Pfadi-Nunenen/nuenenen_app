import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  bool darkMode = false;
  bool allowBiberNotification = false;
  bool allowWolfNotification = false;
  bool allowAetnaNotification = false;
  bool allowSaturnNotification = false;
  bool allowPioNotification = false;
  bool allowDevNotification = false;

  savePref(String key, bool value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool(key, value);
  }

  restorePref() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      darkMode = (sharedPrefs.getBool('darkMode') ?? false);
      allowBiberNotification = (sharedPrefs.getBool('biberNot') ?? false);
      allowWolfNotification = (sharedPrefs.getBool('wolfNot') ?? false);
      allowAetnaNotification = (sharedPrefs.getBool('aetnaNot') ?? false);
      allowSaturnNotification = (sharedPrefs.getBool('saturnNot') ?? false);
      allowPioNotification = (sharedPrefs.getBool('pioNot') ?? false);
      allowDevNotification = (sharedPrefs.getBool('devNot') ?? false);
    });
  }

  setNotificationChannel(String channelKey, bool state, String what) {
    if (state == true) {
      _firebaseMessaging.subscribeToTopic(channelKey);
      Fluttertoast.showToast(
          msg:
              "Benachrichtigungen welche ${what} betreffen werden nun angezeigt!");
    } else if (state == false) {
      _firebaseMessaging.unsubscribeFromTopic(channelKey);
      Fluttertoast.showToast(
          msg:
              "Benachrichtigungen welche ${what} betreffen werden nicht mehr angezeigt!");
    } else {
      print("WTF have you done? This is impossible...");
    }
  }

  @override
  void initState() {
    super.initState();
    restorePref();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Einstellungen",
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
                        "Allgemeines",
                        style: TextStyle(
                            color: mainColor,
                            fontFamily: "Product Sans",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text("Über die APP",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/about',
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
                        "Konfiguration",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Product Sans"),
                      ),
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Dunkles Design",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: darkMode,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        print("Dark Mode - $value");
                        setState(() {
                          if (darkMode) {
                            ThemeData.dark();
                          } else {
                            ThemeData.light();
                          }
                          darkMode = value;
                          savePref('darkMode', value);
                        });
                      },
                    ),
                    Divider(
                      height: 5.0,
                      color: mainColor,
                      thickness: 2.0,
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Benachrichtigungen Biber",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: allowBiberNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowBiberNotification = value;
                        });
                        savePref('biberNot', value);
                        setNotificationChannel(
                            'biber', value, 'die Familie Biberstein');
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Benachrichtigungen Wölf",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: allowWolfNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowWolfNotification = value;
                        });
                        savePref('wolfNot', value);
                        setNotificationChannel(
                            'wolf', value, 'die Meute Phönix');
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Benachrichtigungen Aetna",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: allowAetnaNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowAetnaNotification = value;
                        });
                        savePref('aetnaNot', value);
                        setNotificationChannel(
                            'aetna', value, 'den Stamm Aetna');
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Benachrichtigungen Saturn",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: allowSaturnNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowSaturnNotification = value;
                        });
                        savePref('saturnNot', value);
                        setNotificationChannel(
                            'saturn', value, 'den Trupp Saturn');
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text("Benachrichtigungen Pios",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Theme.of(context).primaryColor)),
                      value: allowPioNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowPioNotification = value;
                        });
                        savePref('pioNot', value);
                        setNotificationChannel('pios', value, 'die Pios');
                      },
                    ),
                    Divider(
                      height: 5.0,
                      color: mainColor,
                      thickness: 1.0,
                    ),
                    SwitchListTile.adaptive(
                      title: Text("**Benachrichtigungen Test**",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: Theme.of(context).primaryColor
                            )),
                      value: allowDevNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowDevNotification = value;
                        });
                        savePref('devNot', value);
                        setNotificationChannel(
                            'devel', value, 'die APP-Programmierer');
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
                        "Feedback",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans",
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Einen Fehler melden",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              //color: currTextColor
                          )),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        launch(
                            "https://github.com/Vento-Nuenenen/nuenenen/issues");
                      },
                    ),
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
