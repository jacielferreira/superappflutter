import 'package:flutter/material.dart';
import 'package:super_app/main.dart';
import 'package:super_app/models/User.dart';

class HomePage extends StatelessWidget {
  UserModel model;
  List<String> dataSource;
  // const HomePage({Key key}) : super(key: key);

  HomePage({this.model}){
    dataSource = [
      "Username: ${model.username}",
      "Password:  ${model.password}",
      "Remember Me: ${model.rememberMe.toString()}"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (context, index){
          var value = dataSource[index];
          return ListTile(
            title: Text(value),
          );
        })
    );
  }
}