import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuenenen/screens/kastenzettel/biber_page.dart';
import 'package:nuenenen/screens/kastenzettel/wolf_page.dart';
import 'package:nuenenen/screens/kastenzettel/aetna_page.dart';
import 'package:nuenenen/screens/kastenzettel/saturn_page.dart';
import 'package:nuenenen/screens/overview/stufen_page.dart';
import 'package:nuenenen/screens/settings/about_page.dart';
import 'package:nuenenen/tab_bar_controller.dart';
import 'package:nuenenen/theme/theme.dart';
import 'package:nuenenen/user_info.dart';

void main() {
  late FirebaseMessaging messaging = FirebaseMessaging();

  // Home Routes
  router.define('/home', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return TabBarController();
    })
  );

  // Settings Routes
  router.define('/about', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return AboutPage();
    })
  );

  router.define('/stufen', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return StufenPage();
    })
  );
  
  router.define('/biber', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return BiberPage();
    })
  );

  router.define('/wolf', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return WolfPage();
    })
  );

  router.define('/aetna', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return AetnaPage();
    })
  );

  router.define('/saturn', handler:
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return SaturnPage();
    })
  );

  runApp(MaterialApp(
    title: "Pfadi Nünenen",
    home: TabBarController(),
    onGenerateRoute: router.generator,
    debugShowCheckedModeBanner: false,
  ));

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.subscribeToTopic("any");
}
