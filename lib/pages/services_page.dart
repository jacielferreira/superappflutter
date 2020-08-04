import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/main.dart';
import 'package:super_app/models/User.dart';
import 'package:super_app/models/UserService.dart';
import 'package:super_app/pages/tab/badst_page.dart';
import 'package:super_app/pages/tab/berserk_page.dart';
import 'package:super_app/pages/tab/traves_page.dart';


class ServicesPage extends StatefulWidget {
  UserModel model;
  ServicesPage({this.model});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
    items: <BottomNavigationBarItem> [
      BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('Traves')),
      BottomNavigationBarItem(
            icon: Icon(Icons.crop_landscape), title: Text('Berserk life')),
      BottomNavigationBarItem(
            icon: Icon(Icons.view_stream), title: Text('Badst')),      
    ],
  ),
  tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => TravesPage(),
            );
            break;
          case 1:
            return BerserkPage(model: widget.model,);
            break;
          case 2:
            return CupertinoTabView(
              builder: (context) => BadstPage(model: widget.model),
            );
            break;
          // default:
          //   return SearchTourPage();
        }
      },
    );
    
  }
}