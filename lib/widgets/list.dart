import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:super_app/models/BitcoinModel.dart';


class BitCoinList extends StatelessWidget {
  final List<Bitcoin> bitcoin;
  BitCoinList({Key key, this.bitcoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: bitcoin == null ? 0 : bitcoin.length,
        itemBuilder: (BuildContext context, int index) {
          return
                new Card(
                  child: new Container(
                    child: new Center(
                        child: new Column(
                     
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          bitcoin[index].name,
                          
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                        
                          "Name:- " + bitcoin[index].name + " Price:- " + bitcoin[index].price.toString(),
                          
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                      ],
                    )),
                    padding: const EdgeInsets.all(15.0),
                  ),
             );
        });
    }
}