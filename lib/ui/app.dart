import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nuenenen_app/constants/strings.dart';
import 'package:nuenenen_app/router.dart';
import 'package:nuenenen_app/ui/screens/initial.dart';
import 'package:nuenenen_app/ui/theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Material(
      color: Colors.transparent,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: themeData(context),
        initialRoute: InitialScreen.routeName,
        routes: AppRouter.routes,
      ),
    );
  }
}
