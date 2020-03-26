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

  addData(bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isDarkMode', val);

    print("New Is DarkMode is");
    print(preferences.getBool('isDarkMode'));
  }
  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);

    bool isSwitched = colors.indexNo == 0 ? false : true;

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
                'DarkTheme',
                style: TextStyle(
                  color: colors.getTimelineTextColor(),
                ),
              ),
              secondary: Icon(
                Icons.brightness_low,
                color: colors.getTimelineTextColor(),
              ),
              value: isSwitched,
              onChanged: (val) {
                print("Vallll is $val");
                addData(val);
                changeStatusBarColor(colors.getStatusBarColor());
                isSwitched = val;
                val ? colors.setIndexNo(1) : colors.setIndexNo(0);
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}