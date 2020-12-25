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
    // TODO: implement build
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Pfadi Nünenen",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ),
        ];
      },
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Wilkommen in der neuen App der Pfadi Nünenen. \n \n"
            "Momentan können im Menüpunkt 'Stufen' die Kastenzettel der Stufen abgerufen werden. \n \n"
            "Daneben kann in den Einstellungen festgelegt werden, von welchen Stufen Push-Benachrichtigungen empfangen werden sollen.",
            style: TextStyle(
              //color: Theme.of(context).textTheme.body1,
              fontSize: 20.0,
            ),
          ),
        )),
      ),
    );
  }
}
