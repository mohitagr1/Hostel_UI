import 'package:flutter/material.dart';
import 'package:hoste_ui/models/meals.dart';
import 'package:hoste_ui/widgets/meal_card.dart';

class MealTimeLine extends StatefulWidget {
  @override
  _MealTimeLineState createState() => _MealTimeLineState();
}

class _MealTimeLineState extends State<MealTimeLine> {
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
                  MealCard(
                    color: mealTimeline.color,
                    mealOffTime: mealTimeline.mealOffTime,
                    mealType: mealTimeline.mealType,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
