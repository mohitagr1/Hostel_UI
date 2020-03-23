import 'package:flutter/material.dart';
import 'package:hoste_ui/models/meals.dart';

class MealTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: mealList.length,
        itemBuilder: (BuildContext context, int index) {
          Meals mealTimeline = mealList[index];
          return Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      mealTimeline.mealOffTime,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * (3 / 4),
                          decoration: BoxDecoration(
                            color: mealTimeline.color,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  mealTimeline.mealType,
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
                                          color: mealTimeline.color,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          mealTimeline.mealOffTime,
                                          style: TextStyle(
                                              color: mealTimeline.color),
                                        ),
                                      ],
                                    ),
                                  ),
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
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
