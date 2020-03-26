import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';

class CalendarHeader extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Provider.of<ThemeColors>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        // height: 80.0,
        width: MediaQuery.of(context).size.width,
        color: colors.getPrimaryColor(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Explore",
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                "Monthly Calender",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
