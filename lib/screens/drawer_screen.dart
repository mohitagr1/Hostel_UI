import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  void changeStatusBarColor(Color col) async {
    await FlutterStatusbarcolor.setStatusBarColor(col);
  }
  SharedPreferences _sharedPreferences;
  bool isSwitched;

  @override
  void initState() {
    super.initState();
    _checkMode();
  }

  _checkMode() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    ThemeColors colors = Provider.of<ThemeColors>(context, listen: false);
    setState(() {
      print("drakMode: ");
      print(_sharedPreferences.getBool("isDarkMode"));
      isSwitched = _sharedPreferences.getBool("isDarkMode") ?? false;
      isSwitched ? colors.setIndexNo(1) : colors.setIndexNo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);

    isSwitched = colors.indexNo == 0 ? false : true;

    return Container(
      color: colors.getAccentcolor(),
      child: ListView(
        //Padding must be Zero for normal functioning of the drawer
        padding: const EdgeInsets.all(00.0),
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              color: colors.getPrimaryColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '--UserID--',
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SwitchListTile(
              title: Text(
                isSwitched?'Apply Light Theme':'Apply Dark Theme',
                style: TextStyle(
                  color: colors.getTimelineTextColor(),
                ),
              ),
              secondary: Icon(
                isSwitched?Icons.brightness_3:Icons.wb_sunny,
                color: colors.getTimelineTextColor(),
              ),
              value: isSwitched,
              onChanged: (val) {
                changeStatusBarColor(colors.getStatusBarColor());
                print("on change");
                print(val);
                _sharedPreferences.setBool("isDarkMode", val);
                isSwitched = val;
                val ? colors.setIndexNo(1) : colors.setIndexNo(0);
              })
        ],
      ),
    );
  }
}