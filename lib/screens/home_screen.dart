import 'package:flutter/material.dart';
import 'package:hoste_ui/screens/calendar_screen.dart';
import 'package:hoste_ui/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



int _selectedIndex = 0;

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
    return Scaffold(
      backgroundColor: _selectedIndex==0 ?Theme.of(context).primaryColor:Theme.of(context).accentColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {})
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Calnedar"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("Profile"),
          )
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
