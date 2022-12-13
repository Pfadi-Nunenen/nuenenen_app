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
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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
    if(state == true) {
      messaging.subscribeToTopic(channelKey);
      Fluttertoast.showToast(
          msg: "Benachrichtigungen welche ${what} betreffen werden nun angezeigt!"
      );
    } else if(state == false) {
      messaging.unsubscribeFromTopic(channelKey);
      Fluttertoast.showToast(
          msg: "Benachrichtigungen welche ${what} betreffen werden nicht mehr angezeigt!"
      );
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
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Einstellungen",
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
          left: 16.0,
        ),
        color: currCardColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0)),
              Card(
                color: currBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Allgemeines",
                        style: TextStyle(
                            color: mainColor,
                            fontFamily: "Product Sans",
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          "Über die APP",
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: currTextColor
                        ),
                      ),
                      trailing: Icon(Icons.navigate_next, color: mainColor),
                      onTap: () {
                        router.navigateTo(context, '/about',
                            transition: TransitionType.native);
                      },
                    ),
                    const Divider(height: 0.0, color: mainColor),
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
                        "Konfiguration",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans"
                        ),
                      ),
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Dunkles Design",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      value: darkMode,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        print("Dark Mode - $value");
                        setState(() {
                          if (darkMode) {
                            currCardColor = darkCardColor;
                            currBackgroundColor = darkBackgroundColor;
                            currTextColor = darkTextColor;
                            currDividerColor = darkDividerColor;
//                          mainColor = darkAccentColor;
                          } else {
                            currCardColor = lightCardColor;
                            currBackgroundColor = lightBackgroundColor;
                            currTextColor = lightTextColor;
                            currDividerColor = lightDividerColor;
//                          mainColor = lightAccentColor;
                          }
                          darkMode = value;
                          savePref('darkMode', value);
                        });
                      },
                    ),
                    const Divider(
                      height: 5.0,
                      color: mainColor,
                      thickness: 2.0,
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Benachrichtigungen Biber",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      value: allowBiberNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowBiberNotification = value;
                        });
                        savePref('biberNot', value);
                        setNotificationChannel(
                            'biber', value, 'die Familie Biberstein'
                        );
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Benachrichtigungen Wölfe",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      value: allowWolfNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowWolfNotification = value;
                        });
                        savePref('wolfNot', value);
                        setNotificationChannel(
                            'wolf', value, 'die Meute Phönix'
                        );
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Benachrichtigungen Aetna",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      value: allowAetnaNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowAetnaNotification = value;
                        });
                        savePref('aetnaNot', value);
                        setNotificationChannel(
                            'aetna', value, 'den Stamm Aetna'
                        );
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Benachrichtigungen Saturn",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      value: allowSaturnNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowSaturnNotification = value;
                        });
                        savePref('saturnNot', value);
                        setNotificationChannel(
                            'saturn', value, 'den Trupp Saturn'
                        );
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "Benachrichtigungen Pios",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        )
                      ),
                      value: allowPioNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowPioNotification = value;
                        });
                        savePref('pioNot', value);
                        setNotificationChannel(
                          'pios', value, 'die Pios'
                        );
                      },
                    ),
                    Divider(
                      height: 5.0,
                      color: mainColor,
                      thickness: 1.0,
                    ),
                    SwitchListTile.adaptive(
                      title: Text(
                        "**Benachrichtigungen Test**",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        )
                      ),
                      value: allowDevNotification,
                      activeColor: mainColor,
                      onChanged: (bool value) {
                        setState(() {
                          allowDevNotification = value;
                        });
                        savePref('devNot', value);
                        setNotificationChannel(
                          'devel', value, 'die APP-Programmierer'
                        );
                      },
                    ),
                    Divider(height: 0.0, color: mainColor),
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
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Feedback",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans",
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Einen Fehler melden",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: currTextColor
                        ),
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: mainColor,
                      ),
                      onTap: () {
                        final uri = Uri.https("github.com", "/Vento-Nuenenen/nuenenen/issues");
                        launchUrl(uri);
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
