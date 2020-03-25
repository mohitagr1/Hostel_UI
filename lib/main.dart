import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<ThemeColors>(
      create: (_) => ThemeColors(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hostel UI',

      // theme: ThemeData(
      //   fontFamily: 'Montserrat',
      //   primaryColor: Color(0xff5748AF),
      //   accentColor: Colors.white,
      // ),
      home: LoginScreen(),
    );
  }
}
