import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:nuenenen/models/kastenzettel.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AetnaPage extends StatefulWidget {
  @override
  _AetnaPageState createState() => _AetnaPageState();
}

class _AetnaPageState extends State<AetnaPage> {
  List<Kastenzettel> kastenzettelList = [];
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
    var URL = Uri.https(baseURI, "node/$aetnaID/json");

    try {
      await http.get(URL).then((response) {
        var json = jsonDecode(response.body);
        for(int i = 0; i < json.length; i++) {
          setState(() {
            kastenzettelList.add(Kastenzettel(
              json['title'].toString(),
              json['body']['und'][0]['value'].toString(),
              json['field_corona_info']['und'][0]['value'].toString()
            ));
          });
        }
      });

      setState(() {
        isLoading = false;
      });
    } catch(error) {
      print("Failed to get Kastenzettel - $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: mainColor,
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
                  style: {
                    "html": Style(
                        whiteSpace: WhiteSpace.PRE,
                        color: currTextColor
                    ),
                  },
                  onLinkTap: (url, _, __, ___) async {
                    //Uri url = Uri.parse(url);
                    if(await canLaunch(url!)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                Html(
                  data: kastenzettelList[0].coronaInfo,
                  style: {
                    "html": Style(color: currTextColor),
                  },
                  onLinkTap: (url, _, __, ___) async {
                    if (await canLaunch(url!)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
