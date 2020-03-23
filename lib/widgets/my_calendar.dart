import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final List<String> dowList = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarController _calendarController;
  String _dow;
  CalendarFormat calendarFormat;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _dow = dowList[DateTime.now().weekday - 1];
    calendarFormat = CalendarFormat.month;
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // color: Colors.red,
      child: TableCalendar(
        onVisibleDaysChanged: (startDay, endDay, format) {},
        calendarController: _calendarController,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendStyle: TextStyle(
            color: Color(0xff393834),
            fontWeight: FontWeight.bold,
          ),
          weekdayStyle: TextStyle(
            color: Color(0xff393834),
            fontWeight: FontWeight.bold,
          ),
        ),
        headerStyle: HeaderStyle(
          // formatButtonVisible: false,
          formatButtonShowsNext: true,
          titleTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          titleTextBuilder: (date, locale) =>
              DateFormat("d MMMM, y").format(date),
        ),
        onDaySelected: (date, events) {
          _dow = dowList[date.weekday - 1];
          // print(_dow);
          // print(_datetime.weekday);
        },
        // daysOfWeekStyle: DaysOfWeekStyle(
        //   dowTextBuilder: (date, locale) => DateFormat.E(locale).format(date)[0],
        // ),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
          CalendarFormat.week: 'Week',
        },
        builders: CalendarBuilders(
          
          selectedDayBuilder: (context, date, event) => selectedDayDesign(
              context, date, event, Theme.of(context).primaryColor),
          todayDayBuilder: (context, date, event) =>
              selectedDayDesign(context, date, event, Color(0xfff07b03)),
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
      ),
    );
  }

  selectedDayDesign(BuildContext context, DateTime date, List<dynamic> event,
      Color boxColor) {
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
}
