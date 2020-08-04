import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/models/User.dart';

class TravesPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var berlinWallFell = new DateTime.utc(1989, 11, 9);
    var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");
 
        return Container(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Center(
              child: Container(
                child: Text("Hi, Welcome to Super App!", 
                style: TextStyle(
                      fontSize: 28,
                      color:Color(0x545B70).withOpacity(0.8)
                    )),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(now.toString(), 
            style: TextStyle(
                  fontSize: 16,
                  color:Color(0x545B70).withOpacity(0.5)
                )),
          ),
        ),
          ],
        )
      ),
    );
  }
}