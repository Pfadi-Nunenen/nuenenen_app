import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:flutter_html/flutter_html.dart';
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
	List<Kastenzettel> kastenzettelList = new List();

	@override
	void initState(){
		super.initState();
		onRefresh();
	}

	Future onRefresh() async{
		print("Lade Daten für den Kastenzettel herunter");
		kastenzettelList.clear();
		var URL = "${baseURI}/node/${biberID}/json";

		try{
			await http.get(URL).then((response){
				var json = jsonDecode(response.body);
				setState(() {
					kastenzettelList.add(new Kastenzettel(json['title'].toString(), json['body']['und'][0]['value'].toString()));
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
		  body: RefreshIndicator(
			  onRefresh: onRefresh,
			  color: darkTextColor,
			  backgroundColor: mainColor,
			  child: new Container(
					color: currBackgroundColor,
				  padding: EdgeInsets.all(16.0),
				  child: new Container(
					  child: new Column(
						  children: <Widget>[
						  	new Text(
								  "${kastenzettelList[0].title}",
								  style: new TextStyle(
									  color: darkTextColor,
									  fontSize: 30,
									  fontWeight: FontWeight.bold,
								  ),
							  ),
							  new Html(
								  data: "${kastenzettelList[0].content}",
								  renderNewlines: true,
							  )
						  ],
					  ),
				  ),
			  ),
		  )
	  );
  }

}