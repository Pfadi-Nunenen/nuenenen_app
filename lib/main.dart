import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuenenen/screens/kastenzettel/biber_page.dart';
import 'package:nuenenen/screens/kastenzettel/aetna_page.dart';
import 'package:nuenenen/screens/kastenzettel/saturn_page.dart';
import 'package:nuenenen/screens/settings/about_page.dart';
import 'package:nuenenen/screens/settings/help_page.dart';
import 'package:nuenenen/screens/kastenzettel/wolf_page.dart';
import 'package:nuenenen/tab_bar_controller.dart';
import 'package:nuenenen/theme/theme.dart';
import 'package:nuenenen/user_info.dart';
import 'package:nuenenen/screens/tools/qr_page.dart';

void main(){
  // Home Routes
  router.define('/home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabBarController();
  }));

  // Settings Routes
  router.define('/about', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AboutPage();
  }));

  router.define('/help', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HelpPage();
  }));

  router.define('/stufen', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HelpPage();
  }));

  router.define('/biber', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new BiberPage();
  }));

  router.define('/wolf', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new WolfPage();
  }));

  router.define('/aetna', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AetnaPage();
  }));

  router.define('/saturn', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SaturnPage();
  }));

  router.define('/qr-reader', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new QRReader();
  }));

  runApp(new MaterialApp(
    title: "Pfadi Nünenen",
    home: new TabBarController(),
    onGenerateRoute: router.generator,
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
  ));
}
