import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  int currentindex = 0;
  var readTimeValue;

  void readTime(String readTimer) {
    readTimeValue = readTimer;
    notifyListeners();
  }

  changeindex(int index) {
    currentindex = index;
    notifyListeners();
  }
}
