import 'package:flutter/material.dart';

class ThemeColors extends ChangeNotifier {
  ThemeColors() {
    getMainBackgroundColor();
  }

  int indexNo = 0;
  final List<Color> primarycolor = [Color(0xff5748AF), Colors.black];
  final List<Color> accentcolor = [Colors.white, Color(0xff212121)];

  final List<Color> mainBackgroundColor = [Color(0xff5748AF), Colors.black];
  final List<Color> calBackgorundColor = [Colors.white, Color(0xff212121)];


  final List<Color> initialDateColor = [Color(0xff5748AF), Colors.white];
  final List<Color> weekendColors = [Color(0xff5748AF), Colors.grey[400]];
  final List<Color> weekdayColors = [Color(0xff393834), Colors.grey[700]];


  final List<Color> timelineBackColor = [Colors.grey[200], Colors.grey[800]];
  final List<Color> timelineTextColor = [Colors.black, Colors.white];

  final Map<int, List<Color>> mealTimeColorBack = {
    1: [Color(0xffa17801), Color(0xff819023), Color(0xffa51c4b)],
    0: [Color(0xffF9BB06), Color(0xffBAD60D), Colors.pink]
  };

  final Map<int, List<Color>> mealTimeColorText = {
    0: [Color(0xffa17801), Color(0xff819023), Color(0xffa51c4b)],
    1: [Colors.grey[300], Colors.grey[300], Colors.grey[300]]
  };

  final List<Color> bottomBarText = [Color(0xff5748AF), Colors.grey[300]];
  final List<Color> bottomBarBackgoundColor = [Colors.white, Colors.black];

  final List<Color> statusBarColor = [Color(0xff212121),Color(0xff5748AF),];

  Color getStatusBarColor()
  {
    return statusBarColor[indexNo];
  }

  Color getbottomBarBackgoundColor() {
    return bottomBarBackgoundColor[indexNo];
  }

  Color getBottomBarText() {
    return bottomBarText[indexNo];
  }

  Color getmealTimeColorText(int index) {
    return mealTimeColorText[indexNo][index];
  }

  Color getmealTimeColorBack(int index) {
    return mealTimeColorBack[indexNo][index];
  }

  Color getTimelineBackColor() {
    return timelineBackColor[indexNo];
  }

  Color getTimelineTextColor() {
    return timelineTextColor[indexNo];
  }

  Color getWeekDayColors() {
    return weekdayColors[indexNo];
  }

  Color getWeekendColors() {
    return weekendColors[indexNo];
  }

  Color getPrimaryColor() {
    return primarycolor[indexNo];
  }

  Color getInitialDateColor() {
    return initialDateColor[indexNo];
  }

  Color getAccentcolor() {
    return accentcolor[indexNo];
  }

  setIndexNo(int gg) {
    indexNo = gg;
    print(indexNo);
    notifyListeners();
  }

  Color getMainBackgroundColor() {
    return mainBackgroundColor[indexNo];
  }

  Color getCalBackgorundColor() {
    return calBackgorundColor[indexNo];
  }
}
