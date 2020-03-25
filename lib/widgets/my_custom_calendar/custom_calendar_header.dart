import 'package:flutter/material.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
    ThemeColors colors = Provider.of<ThemeColors>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat("d MMMM, y").format(widget.headerDate),
            style: TextStyle(
                color: colors.getInitialDateColor(),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
