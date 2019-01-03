import 'package:flutter/material.dart';
import 'package:flutter_app/LoadingDialog.dart';
import 'main.dart';

main() {
  runApp(LoginHome());
}

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.blue,
      home: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: 380.0,
        padding: EdgeInsets.only(top: 120.0, left: 30.0, right: 30.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          child: LoginBody(),
        ),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginBodyState();
  }
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 14.0, right: 12.0),
          child: buildEditText(
              "请输入账号", _nameController, TextInputType.text, false, context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 4.0, right: 12.0),
          child: buildEditText("请输入密码", _passwordController,
              TextInputType.number, true, context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 24.0, right: 12.0),
          child: PhysicalModel(
            elevation: 5.0,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15.0),
            child: MaterialButton(
              height: 45.0,
              onPressed: () {
                /*  if (_nameController.text.isEmpty) {
                  _createDialog(context, "账号不能为空");
                  return;
                } else if (_passwordController.text.isEmpty) {
                  _createDialog(context, "密码不能为空");
                  return;
                }*/
                delay(context);
              },
              child: Center(
                child: Text(
                  "登陆",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future delay(BuildContext context) async {
  _showLoadingDialog(context);
  await Future.delayed(Duration(seconds: 3), () {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  });
  //Navigator.pop(context);
}

TextField buildEditText(String labelText, TextEditingController controller,
    TextInputType type, bool obscureText, BuildContext context) {
  return TextField(
    autofocus: false,
    keyboardType: type,
    maxLines: 1,
    obscureText: obscureText,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.blue), labelText: labelText),
    controller: controller,
    style: TextStyle(
      fontSize: 20.0,
      color: Colors.blue,
    ),
  );
}

void _createDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(text),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ok"))
            ],
          ));
}

void _showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return LoadingDialog(text: "正在读取");
      });
}
