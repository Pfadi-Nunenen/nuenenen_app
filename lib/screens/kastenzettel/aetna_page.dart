import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/models/kastenzettel.dart';
import 'package:nuenenen/user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AetnaPage extends StatefulWidget {
  @override
  _AetnaPage createState() => _AetnaPage();
}

class _AetnaPage extends State<AetnaPage> {
  List<Kastenzettel> kastenzettelList = List();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  Future onRefresh() async {
    setState(() {
      isLoading = true;
    });

    print("Lade Daten für den Kastenzettel herunter");
    kastenzettelList.clear();
    var URL = "${baseURI}/node/${aetnaID}/json";

    try {
      await http.get(URL).then((response) {
        var json = jsonDecode(response.body);
        for (int i = 0; i < json.length; i++) {
          setState(() {
            kastenzettelList.add(Kastenzettel(
              json['title'].toString(),
              json['body']['und'][0]['value'].toString()
            ));
          });
        }
      });
      
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print("Failed to get Kastenzettel - $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: mainColor,
        actionsForegroundColor: Colors.white,
        previousPageTitle: "Stufen",
        middle: Text(
          "Aetna",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? Container(
              color: currBackgroundColor,
              child: Center(
                child: CircularProgressIndicator(),
              ))
          : RefreshIndicator(
              onRefresh: onRefresh,
              color: darkTextColor,
              backgroundColor: currBackgroundColor,
              child: Container(
                color: currBackgroundColor,
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        kastenzettelList[0].title.toString(),
                        style: TextStyle(
                            color: currTextColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Html(
                        data: kastenzettelList[0].content,
                        renderNewlines: true,
                        onLinkTap: (url) async {
                          if (await canLaunch(url)) {
                            await launch(url, forceSafariVC: false);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        defaultTextStyle: TextStyle(color: currTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
