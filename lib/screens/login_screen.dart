import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/screens/home_screen.dart';
import 'package:hoste_ui/teddy_github/teddy_controller.dart';
import 'package:hoste_ui/teddy_github/tracking_text_input.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TeddyController _teddyController;

  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  SharedPreferences _preferences;
  @override
  initState() {
    _teddyController = TeddyController();
    sharedPreferences.then((SharedPreferences sharedPreferences) {
      return (sharedPreferences.getBool('isLoggedIn') ?? false);
    });
    _checkPref();
    super.initState();
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void apicall(String userid, String pass) async {
    var url = "http://192.168.43.116:9090/login/get/$userid/$pass";
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      if (json.decode(response.body)) {
        await _preferences.setBool('isLoggedIn', true);
        await _preferences.setString('hostelerId', userid);
        _teddyController.play("success");
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      } else {
        await _preferences.setBool('isLoggedIn', false);
        await _preferences.remove('hostelerId');
        _teddyController.play("fail");
      }
    } else {
      throw "Can't get Hostelers.";
    }
  }

  void _checkPref() async {
    _preferences = await sharedPreferences;
    print(_preferences.getBool('isLoggedIn'));
    if (_preferences.getBool('isLoggedIn') != null &&
        _preferences.getBool('isLoggedIn')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: MediaQuery.of(context).size.width - 80,
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
                  onTextChanged: (String value) {
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
    String _username = _usernameController.text;
    String _password = _passwordController.text;
    apicall(_username, _password);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }
}
