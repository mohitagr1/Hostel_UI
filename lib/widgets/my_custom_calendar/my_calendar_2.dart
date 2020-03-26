import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_calendar_header.dart';

final List<String> dowList = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class MyCustomCalendar extends StatefulWidget {
  @override
  _MyCustomCalendarState createState() => _MyCustomCalendarState();
}

class _MyCustomCalendarState extends State<MyCustomCalendar> {
  CalendarController _calendarController;
  DateTime _headerDate;
  String _dow;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _headerDate = DateTime.now();
    _dow = dowList[DateTime.now().weekday - 1];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ThemeColors colors = Provider.of<ThemeColors>(context);
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            CustomCalendarHeader(headerDate: _headerDate),
            TableCalendar(
              availableGestures: AvailableGestures.horizontalSwipe,
              calendarController: _calendarController,
              headerVisible: false,
              rowHeight: 50,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                weekendStyle: TextStyle(
                  color: colors.getWeekendColors(),
                  fontWeight: FontWeight.bold,
                ),
                weekdayStyle: TextStyle(
                  color: colors.getWeekDayColors(),//Color(0xff393834),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onVisibleDaysChanged: (_, __, ___) {
                setState(() {
                  DateTime _selectedDay = _calendarController.selectedDay;
                  DateTime _focusedDay = _calendarController.focusedDay;
                  _headerDate = _selectedDay.month != _focusedDay.month
                      ? _focusedDay
                      : _selectedDay;
                  _dow = dowList[_headerDate.weekday - 1];
                });
              },
              onDaySelected: (date, events) {
                _dow = dowList[date.weekday - 1];
                setState(() {
                  _headerDate = date;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, event) => selectedDayDesign(
                    context, date, event, Theme.of(context).primaryColor),
                todayDayBuilder: (context, date, event) =>
                    selectedDayDesign(context, date, event, Color(0xff897ec7)),
                dowWeekdayBuilder: (context, weekday) => Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: weekday == _dow ? Colors.grey[300] : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    weekday[0],
                    style: TextStyle(
                      color: weekday == _dow
                          ? Theme.of(context).primaryColor
                          : Colors.grey[400],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

selectedDayDesign(
    BuildContext context, DateTime date, List<dynamic> event, Color boxColor) {
  return Container(
    child: Text(
      date.day.toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    ),
    margin: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700],
            offset: Offset(0, 5),
            blurRadius: 10.0,
          )
        ]),
    alignment: Alignment.center,
  );
}
