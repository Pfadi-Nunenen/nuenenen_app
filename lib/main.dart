import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuenenen/screens/home/home_page.dart';
import 'package:nuenenen/screens/settings/about_page.dart';
import 'package:nuenenen/screens/settings/help_page.dart';
import 'package:nuenenen/tab_bar_controller.dart';
import 'package:nuenenen/theme/theme.dart';
import 'package:nuenenen/user_info.dart';

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

  router.define('/help', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HelpPage();
  }));

  router.define('/help', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HelpPage();
  }));

  router.define('/help', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HelpPage();
  }));

  runApp(new MaterialApp(
    title: "Pfadi Nünenen",
    home: new TabBarController(),
    onGenerateRoute: router.generator,
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
  ));
}