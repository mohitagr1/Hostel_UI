import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/widgets/calendar_header.dart';
import 'package:hoste_ui/widgets/my_custom_calendar/my_calendar_2.dart';
import 'package:hoste_ui/widgets/timelines.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CalendarHeader(),
          Container(
            color: colors.getPrimaryColor(),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: colors.getAccentcolor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  // MyCalendar(),
                  MyCustomCalendar(),
                  Divider(color: colors.getTimelineBackColor(),thickness: 2,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Timeline",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  MealTimeLine(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
