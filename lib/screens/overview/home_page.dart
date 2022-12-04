import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Pfadi Nünenen",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ),
        ];
      },
      body: Container(
        color: currBackgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Wilkommen in der neuen App der Pfadi Nünenen. \n \n"
              "Momentan können im Menüpunkt 'Stufen' die Kastenzettel der Stufen abgerufen werden. \n \n"
              "Daneben kann in den Einstellungen festgelegt werden, von welchen Stufen Push-Benachrichtigungen empfangen werden sollen.",
              style: TextStyle(
                color: currTextColor,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
