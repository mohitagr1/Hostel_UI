import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Meals{
  final String mealType;
  final String mealOffTime;
  final Color color;

  Meals(this.mealType, this.mealOffTime, this.color,);
}

final List<Meals> mealList = [
  Meals(
    "Breakfast",
    "10:00 PM",
    Color(0xffF9BB06),
  ),
  Meals(
    "Lunch",
    "10:00 AM",
    Color(0xffBAD60D),
  ),
  Meals(
    "Dinner",
    "5:00 PM",
    Colors.pink,
  ),
];