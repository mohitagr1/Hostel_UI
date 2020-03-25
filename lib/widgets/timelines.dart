import 'package:flutter/material.dart';
import 'package:hoste_ui/models/meals.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';

class MealTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: mealList.length,
        itemBuilder: (BuildContext context, int index4) {
          Meals mealTimeline = mealList[index4];
          return Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: colors.getTimelineBackColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      mealTimeline.mealOffTime,
                      style: TextStyle(color: colors.getTimelineTextColor()),
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
                            color: colors.getmealTimeColorBack(index4),//mealTimeline.color,
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
                                      color: colors.getAccentcolor(),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: colors.getTimelineBackColor(),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          color: colors.getmealTimeColorBack(index4),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          mealTimeline.mealOffTime,
                                          style: TextStyle(
                                              color: colors.getmealTimeColorText(index4)),
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
