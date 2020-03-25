import 'package:flutter/material.dart';

class MealCard extends StatefulWidget {
  final Color color;
  final String mealOffTime;
  final String mealType;
  const MealCard({Key key, this.color, this.mealOffTime, this.mealType})
      : super(key: key);
  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * (3 / 4),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.mealType,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: widget.color,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.mealOffTime,
                            style: TextStyle(
                              color: widget.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
