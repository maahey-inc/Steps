import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  int currentindex = 0;
  var readTimeValue;

  double mondaySteps;
  double tuesdaySteps;
  double wednesdaySteps;
  double thursdaySteps;
  double fridaySteps;
  double saturdaySteps;
  double sundaySteps;

  double mondayReadMinutes;
  double tuesdayReadMinutes;
  double wednesdayReadMinutes;
  double thursdayReadMinutes;
  double fridayReadMinutes;
  double saturdayReadMinutes;
  double sundayReadMinutes;

  void readTime(String readTimer) {
    readTimeValue = readTimer;
    notifyListeners();
  }

  changeindex(int index) {
    currentindex = index;
    notifyListeners();
  }

  void mondayStepsValue(monSteps) {
    mondaySteps = monSteps;
    notifyListeners();
  }

  void tuesdayStepsValue(tueSteps) {
    tuesdaySteps = tueSteps;
    notifyListeners();
  }

  void wednesdayStepsValue(wedSteps) {
    wednesdaySteps = wedSteps;
    notifyListeners();
  }

  void thursdayStepsValue(thuSteps) {
    thursdaySteps = thuSteps;
    notifyListeners();
  }

  void fridayStepsValue(friSteps) {
    fridaySteps = friSteps;
    notifyListeners();
  }

  void saturdayStepsValue(satSteps) {
    saturdaySteps = satSteps;
    notifyListeners();
  }

  void sundayStepsValue(sunSteps) {
    sundaySteps = sunSteps;
    notifyListeners();
  }

  void mondayReadMinutesValue(monReadMinutes) {
    mondayReadMinutes = monReadMinutes;
    notifyListeners();
  }

  void tuesdayReadMinutesValue(tueReadMinutes) {
    tuesdayReadMinutes = tueReadMinutes;
    notifyListeners();
  }

  void wednesdayReadMinutesValue(wedReadMinutes) {
    wednesdayReadMinutes = wedReadMinutes;
    notifyListeners();
  }

  void thursdayReadMinutesValue(thuReadMinutes) {
    thursdayReadMinutes = thuReadMinutes;
    notifyListeners();
  }

  void fridayReadMinutesValue(friReadMinutes) {
    fridayReadMinutes = friReadMinutes;
    notifyListeners();
  }

  void saturdayReadMinutesValue(satReadMinutes) {
    saturdayReadMinutes = satReadMinutes;
    notifyListeners();
  }

  void sundayReadMinutesValue(sunReadMinutes) {
    sundayReadMinutes = sunReadMinutes;
    notifyListeners();
  }
}
