import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:super_app/models/BitcoinModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:super_app/models/User.dart';
import 'package:super_app/widgets/list.dart';



class BerserkPage extends StatelessWidget {
  var jsonResult;
  UserModel model;
  Bitcoin dataModel;
  List<String> dataSource;
  List<dynamic> dataCoin;
  

  loadJson() async {
  String data = await rootBundle. loadString('resources/json/latest.json');
  // dataModel = (json.decode(data)).map((i) => 
  //     Datum.fromJson(i)).toList();
  // print(dataCoin);
}
  // const HomePage({Key key}) : super(key: key);

  BerserkPage({this.model}){
   loadJson();
    dataSource = [
      "Username: ${model.username}",
      "Password:  ${model.password}",
      "Remember Me: ${model.rememberMe.toString()}"
    ];
  }


  Widget build(BuildContext context) {

    future: DefaultAssetBundle.of(context)
                    .loadString('resources/json/latest.json');

    return SafeArea(child: Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
                child:Text("Life Style", style: TextStyle(
                  fontSize: 16,
                  color:Color(0x545B70).withOpacity(0.5)
                ))
              ),

               Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child:Text("${model.username}, Your approximate balance", style: TextStyle(
                  fontSize: 28,
                  color:Color(0x545B70).withOpacity(0.8)
                ))
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
                child:Text("Current balance", style: TextStyle(
                  fontSize: 16,
                  color:Color(0x545B70).withOpacity(0.5)
                ))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:Text("0.49", style: TextStyle(
                  fontSize: 34,
                  color:Color(0x545B70).withOpacity(0.8)
                ))
              ),
              
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_drop_down,
                   color: Color(0xC6C7CC).withOpacity(0.8),
                   ),
                  Text("1.3%", style: TextStyle(
                  fontSize: 18,
                  color:Color(0xFFB6B6).withOpacity(0.8)),
                  ),
                  
                ]
              ),
              Row(
                children: <Widget>[
                  
                ],
              ),
              
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 340, 0, 0),
            child: Center(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('resources/json/latest.json'),
                builder: (context, snapshot) {
                  List<Bitcoin> bitcoins =
                      parseJosn(snapshot.data.toString());
                  return bitcoins.isNotEmpty
                      ? new BitCoinList(bitcoin: bitcoins,)
                      : new Center(child: new CircularProgressIndicator());
                }),
            )
          )
          
        ],
      ),
    )
    );
  }

  List<Bitcoin> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Bitcoin>((json) => new Bitcoin.fromJson(json)).toList();
  }
}