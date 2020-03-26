import 'package:flutter/material.dart';
import 'package:hoste_ui/models/meals.dart';
import 'package:hoste_ui/widgets/meal_card.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';

class MealTimeLine extends StatefulWidget {
  @override
  _MealTimeLineState createState() => _MealTimeLineState();
}

class _MealTimeLineState extends State<MealTimeLine> {
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
                  MealCard(
                    color: colors.getmealTimeColorBack(index4),
                    mealOffTime: mealTimeline.mealOffTime,
                    mealType: mealTimeline.mealType,
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
