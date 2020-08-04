import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_app/models/User.dart';
import 'package:super_app/pages/home_page.dart';
import 'package:super_app/pages/services_page.dart';

class LoginPage extends StatefulWidget
{
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  var model = UserModel(username: "", password: "", rememberMe: false);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Testing"),
      // ),
      body: Stack(
        children: [
          DefaultBackground(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24),
              child: SignInWidget(
                model: model,
                callback: (model) {
                  this.model = model;

                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(Duration(seconds: 3)).then((_) {
                    setState(() {
                      isLoading = false;
                    });

                    presentHomePage(context: context);
                  });
                },
              ),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()
        ],
      ),
    );
  }

  presentHomePage({BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ServicesPage(
          model: model,
            )));
  }
}

class DefaultBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue.withOpacity(0.1));
  }
}

class SignInWidget extends StatefulWidget {
  final Function callback;
  UserModel model;

  SignInWidget({this.callback, this.model});

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: 8),
        CircleImage(
          height: 150,
          imageName: "resources/images/flutter_logo.png",
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
              helperText: "Enter a valid username", hintText: "Username"),
          onChanged: (value) {
            widget.model.username = value;
          },
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              helperText: "Enter a valid password", hintText: "Password"),
          onChanged: (value) {
            widget.model.password = value;
          },
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Remember me"),
                Checkbox(
                  value: widget.model.rememberMe,
                  onChanged: (value) {
                    setState(() {
                      widget.model.rememberMe = value;
                    });
                  },
                ),
              ],
            ),
            FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ))
          ],
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              widget.callback(widget.model);
            },
            child: Text("Sign In", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

class CircleImage extends StatelessWidget {
  final double height;
  final String imageName;

  CircleImage({this.height, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imageName)),
          borderRadius: BorderRadius.all(Radius.circular(height / 2))),
    );
  }
}

class ColumnListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("description"),
                  SizedBox(
                    height: 8,
                  ),
                  TextField()
                ],
              ),
              Text("Testing")
            ],
          ),
        ],
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  final String text;

  DefaultText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 45, color: Colors.blue));
  }
}