import 'package:flutter/material.dart';
import 'package:super_app/pages/login_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundImage(
            imageName: "resources/images/bg_intro.png",
            width: 350,
            left: 50,
            right: 0,
            top: 0,
            bottom: 0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(390, 100, 0, 0),
            child: BackgroundImage(
            imageName: "resources/images/shape.png",
            height: 12,
            width: 55,
            left: 120,
            right: 0,
            top: 0,
            bottom: 50,
          ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(190, 220, 0, 0),
            child: BackgroundImage(
            imageName: "resources/images/group.png",
            width: 250,
            height: 350,
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
          ),
          ),
          TitleText(
            titleText: "This",
            fontSize: 44,
            colorFont: 0x99545B70,
            position: 40.0,
          ),
          TitleText(
            titleText: "Super",
            fontSize: 44,
            colorFont: 0x99679B9B,
            position: 90.0,
          ),
          TitleText(
            titleText: "App.",
            fontSize: 44,
            colorFont: 0x99545B70,
            position: 140.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
               Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ));
                },
                child: Text("Join Now", style: TextStyle(fontSize:20, color:Color(0x545B70).withOpacity(0.8))),
                color: Colors.white,
              ),
        )
            ],
          )
        ],
      )
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageName;
  final double left;
  final double top;
  final double right;
  final double bottom;


  BackgroundImage({
    this.imageName,
    this.width,
    this.height,
    this.left,
    this.top,
    this.right,
    this.bottom,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageName))
      ),
    );
  }

}


class TitleText extends StatelessWidget {

  final double fontSize;
  final String titleText;
  final int colorFont;
  final double position;

  TitleText({
    this.fontSize,
    this.titleText,
    this.colorFont,
    this.position
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.fromLTRB(20, position, 0, 0),
            child: Text(titleText, style: TextStyle(
              fontSize: fontSize,
              color: Color(colorFont).withOpacity(0.8),
            ),
            )
          );
  }

}