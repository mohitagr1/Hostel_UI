import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/screens/calendar_screen.dart';
import 'package:hoste_ui/screens/drawer_screen.dart';
import 'package:hoste_ui/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() {
    addData();
  }

  addData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('themeValue', 0);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isSwitched;

  static List<Widget> _widgetOptions = <Widget>[
    CalendarScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);
    //Gets executed once and sets the status bar color at the launch of the application

    if (colors.indexNo==0) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Color(0xff5748AF)));
    } else {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Color(0xff212121)));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.getPrimaryColor(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {})
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: DrawerScreen()
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colors.getbottomBarBackgoundColor(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.calendar_today,
              color: colors.getInitialDateColor(),
            ),
            icon: Icon(Icons.calendar_today, color: Colors.grey[600]),
            title: Text(
              "Calnedar",
              style: TextStyle(color: colors.getBottomBarText()),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.person_pin, color: colors.getInitialDateColor()),
            icon: Icon(Icons.person_pin, color: Colors.grey[600]),
            title: Text(
              "Profile",
              style: TextStyle(color: colors.getTimelineTextColor()),
            ),
          )
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
