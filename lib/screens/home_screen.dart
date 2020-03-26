import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/screens/calendar_screen.dart';
import 'package:hoste_ui/screens/drawer_screen.dart';
import 'package:hoste_ui/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isSwitched;
  SharedPreferences _sharedPreferences;

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
      drawer: SafeArea(
        child: Drawer(child: DrawerScreen()),
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
