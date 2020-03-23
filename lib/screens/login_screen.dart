import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:hoste_ui/screens/home_screen.dart';
import 'package:hoste_ui/teddy_github/teddy_controller.dart';
import 'package:hoste_ui/teddy_github/tracking_text_input.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> apicall(String userid, String pass) async {
    print("iiihihi");
    var url = "http://localhost:9090/login/loginVer/$userid/$pass";
    // var url = "https://flutter.dev/";
    var response = await http.read(url);
    print("nono");
    print(response);
    print("yoyo");
    // print(json.decode(response.body));
    return true;
  }

  lookit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  height: 200,
                  width: MediaQuery.of(context).size.width-80,
                  // color: Colors.blue,
                  child: FlareActor(
                    "assets/flare/Teddy.flr",
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomCenter,
                    controller: _teddyController,
                  ),
                ),
                TrackingTextInput(
                  hint: "User Id",
                  onCaretMoved: (Offset caret) {
                    _teddyController.lookAt(caret);
                  },
                  onTextChanged: (String value){
                    _usernameController.text = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TrackingTextInput(
                  hint: "Password",
                  isObscured: true,
                  onCaretMoved: (Offset caret) {
                    _teddyController.lookAt(caret);
                  },
                  onTextChanged: (String value) {
                    _passwordController.text = value;
                    _teddyController.setPassword(value);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Theme.of(context).primaryColor,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: _performLogin,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Log in",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performLogin() {
    // _teddyController.submitPassword();
    String _username = _usernameController.text;
    String _password = _passwordController.text;
    if(_password=="lokesh"){
      _teddyController.play("success");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else{
      _teddyController.play("fail");
    }

    print('login attempt: $_username with $_password');
    apicall(_username, _password);
  }
}
