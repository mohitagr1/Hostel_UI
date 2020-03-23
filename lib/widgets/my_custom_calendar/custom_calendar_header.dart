import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendarHeader extends StatefulWidget {
  final DateTime headerDate;

  const CustomCalendarHeader({Key key, this.headerDate}) : super(key: key);

  @override
  _CustomCalendarHeaderState createState() => _CustomCalendarHeaderState();
}

class _CustomCalendarHeaderState extends State<CustomCalendarHeader> {
  // Future<DateTime> selectDate(BuildContext context) async {
  //   final DateTime picked = await MonthPicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2090),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat("d MMMM, y").format(widget.headerDate),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
