import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';
import 'package:nuenenen/models/kastenzettel.dart';
import 'package:nuenenen/user_info.dart';

class BiberPage extends StatefulWidget{
	@override
	_BiberPage createState() => _BiberPage();
}

class _BiberPage extends State<BiberPage>{
	List<Kastenzettel> kastenzettel = new List();

	@override
	void initState(){
		super.initState();
		onRefresh();
	}

	Future onRefresh() async{
		print("Lade Daten für den Kastenzettel herunter");
		kastenzettel.clear();
		var URL = "${baseURI}/node/${biberID}/json";

		try{
			await http.get(URL).then((response){
				var json = jsonDecode(response.body);
				setState(() {
				  kastenzettel.add(new Kastenzettel(json['title'], json['body']['und'][0]['value']));
				});
			});
			setState(() {});
		}catch(error){
			print("Failed to get Kastenzettel - $error");
		}
	}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
	  return Scaffold(
		  body: Container(
			  color: currBackgroundColor,
			  child: new Center(
				  child: new Text(
					  "This will become the Biber-Section",
					  style: TextStyle(color: currTextColor),
				  ),
			  ),
		  ),
	  );
  }

}