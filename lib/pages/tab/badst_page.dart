import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/models/User.dart';

class BadstPage extends StatelessWidget {
  UserModel model;
  List<String> dataSource;

  BadstPage({this.model}) {
    dataSource = [
      "Username: ${model.username}",
      "Password: ${model.password}",
      "Remember Me: ${model.rememberMe.toString()}"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView.builder(
            itemCount: dataSource.length,
            itemBuilder: (context, index) {
              var value = dataSource[index];
              return ListTile(
                title: Text(value),
              );
            })));
  }
}