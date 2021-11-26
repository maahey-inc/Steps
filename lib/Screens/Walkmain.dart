import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/Widgets/LineChart.dart';
import 'package:steps_app/Widgets/bar_chart_widget.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../theme.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class Walkmainscreen extends StatefulWidget {
  @override
  _WalkmainscreenState createState() => _WalkmainscreenState();
}

class _WalkmainscreenState extends State<Walkmainscreen> {
  //! Steps List
  List<HealthDataPoint> _healthDataListDaySteps = [];
  List<HealthDataPoint> _healthDataListWeekSteps = [];
  List<HealthDataPoint> _healthDataListMonthSteps = [];
  //! MoveMinutes List
  List<HealthDataPoint> _healthDataListDayMoveMinutes = [];
  List<HealthDataPoint> _healthDataListWeekMoveMinutes = [];
  List<HealthDataPoint> _healthDataListMonthMoveMinutes = [];

  AppState _state = AppState.DATA_NOT_FETCHED;

  var mondaySteps;
  var mondayReadTime;
  var mondayStartDateDay;
  var mondayEndDateDay;
  var mondayStartDateWeek;
  var mondayEndDateWeek;
  var mondayUid;

  var tuesdaySteps;
  var tuesdayReadTime;
  var tuesdayStartDateDay;
  var tuesdayEndDateDay;
  var tuesdayStartDateWeek;
  var tuesdayEndDateWeek;
  var tuesdayUid;

  var wednesdaySteps;
  var wednesdayReadTime;
  var wednesdayStartDateDay;
  var wednesdayEndDateDay;
  var wednesdayStartDateWeek;
  var wednesdayEndDateWeek;
  var wednesdayUid;

  var thursdaySteps;
  var thursdayReadTime;
  var thursdayStartDateDay;
  var thursdayEndDateDay;
  var thursdayStartDateWeek;
  var thursdayEndDateWeek;
  var thursdayUid;

  var fridaySteps;
  var fridayReadTime;
  var fridayStartDateDay;
  var fridayEndDateDay;
  var fridayStartDateWeek;
  var fridayEndDateWeek;
  var fridayUid;

  var saturdaySteps;
  var saturdayReadTime;
  var saturdayStartDateDay;
  var saturdayEndDateDay;
  var saturdayStartDateWeek;
  var saturdayEndDateWeek;
  var saturdayUid;

  var sundaySteps;
  var sundayReadTime;
  var sundayStartDateDay;
  var sundayEndDateDay;
  var sundayStartDateWeek;
  var sundayEndDateWeek;
  var sundayUid;

  double stepsDay = 0.0;
  double stepsWeek = 0.0;
  double stepsMonth = 0.0;

  double milesDay = 0.0;
  double milesWeek = 0.0;
  double milesMonth = 0.0;

  double stepsToKmDay = 0.0;
  double stepsToKmWeek = 0.0;
  double stepsToKmMonth = 0.0;

  double moveMinutesDay = 0.0;
  double moveMinutesWeek = 0.0;
  double moveMinutesMonth = 0.0;

  bool isDay = false;
  bool isWeek = false;
  bool isMonth = false;

  bool isTextColorDay = false;
  bool isTextColorWeek = false;
  bool isTextColorMonth = false;

  double steps = 0.0;
  double miles = 0.0;
  double km = 0.0;
  double moveMinutes = 0.0;

  String daysCountText = "";

  Future fetchData() async {
    HealthFactory health = HealthFactory();
    List<HealthDataType> typesSteps = [
      HealthDataType.STEPS,
      // HealthDataType.MOVE_MINUTES
      // HealthDataType.DISTANCE_DELTA,
      // HealthDataType.WEIGHT,
      //HealthDataType.HEIGHT,
      //HealthDataType.BLOOD_GLUCOSE,
      //HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    List<HealthDataType> typesMoveMinutes = [HealthDataType.MOVE_MINUTES];
    //! Display default date Only
    // DateTime.now().toIso8601String().split('T').first

    //! For Day
    // DateTime startDateDay = DateTime.now().subtract(Duration(days: 1));
    // DateTime endDateDay = DateTime.now();
    DateTime _firstDateOfTheDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime _lastDateOfTheDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    DateTime startDateDay = _firstDateOfTheDay;
    DateTime endDateDay = _lastDateOfTheDay;
    // DateFormat format = DateFormat("HH:mm:ss");
    // String tempDate = DateFormat.Hms().format(startDateDay);
    print("Today's Day:          " +
        DateFormat('EEEE').format(DateTime.now()).toString());
    print("Today start Date:       " + _firstDateOfTheDay.toString());
    print("Today end Date:       " + _lastDateOfTheDay.toString());

    //! For Week
    DateTime _firstDateOfTheweek =
        DateTime.now().subtract(new Duration(days: DateTime.now().weekday - 1));
    DateTime _lastDateOfWeek = _firstDateOfTheweek.add(new Duration(days: 6));
    DateTime startDateWeek = _firstDateOfTheweek;
    DateTime endDateWeek = _lastDateOfWeek;
    print("Week start Date:       " + _firstDateOfTheweek.toString());
    print("Week end Date:       " + _lastDateOfWeek.toString());

    //! For Month
    var _firstDateOfMonth =
        new DateTime(DateTime.now().year, DateTime.now().month, 1);
    var _lastDateOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    DateTime startDateMonth = _firstDateOfMonth;
    DateTime endDateMonth = _lastDateOfMonth;
    print("Month start Date:       " + _firstDateOfMonth.toString());
    print("Month end Date:       " + _lastDateOfMonth.toString());

    //setState(() => _state = AppState.FETCHING_DATA);

    // print("getting Access");

    // you MUST request access to the data types before reading them
    bool stepsAccessWasGranted = await health.requestAuthorization(typesSteps);
    bool moveMinutesAccessWasGranted =
        await health.requestAuthorization(typesMoveMinutes);
    // print(stepsAccessWasGranted);

    stepsDay = 0;
    stepsWeek = 0;
    stepsMonth = 0;

    milesDay = 0;
    milesWeek = 0;
    milesMonth = 0;

    moveMinutesDay = 0;
    moveMinutesWeek = 0;
    moveMinutesMonth = 0;

    //! Getting Steps Data
    if (stepsAccessWasGranted) {
      try {
        // fetch new data
        List<HealthDataPoint> healthDataDaySteps = await health
            .getHealthDataFromTypes(startDateDay, endDateDay, typesSteps);
        List<HealthDataPoint> healthDataWeekSteps = await health
            .getHealthDataFromTypes(startDateWeek, endDateWeek, typesSteps);
        List<HealthDataPoint> healthDataMonthSteps = await health
            .getHealthDataFromTypes(startDateMonth, endDateMonth, typesSteps);

        // save all the new data points
        _healthDataListDaySteps.addAll(healthDataDaySteps);
        _healthDataListWeekSteps.addAll(healthDataWeekSteps);
        _healthDataListMonthSteps.addAll(healthDataMonthSteps);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      //! Getting Move Minutes
      if (moveMinutesAccessWasGranted) {
        try {
          // fetch new data
          List<HealthDataPoint> healthDataDayMoveMinutes =
              await health.getHealthDataFromTypes(
                  startDateDay, endDateDay, typesMoveMinutes);
          List<HealthDataPoint> healthDataWeekMoveMinutes =
              await health.getHealthDataFromTypes(
                  startDateWeek, endDateWeek, typesMoveMinutes);
          List<HealthDataPoint> healthDataMonthMoveMinutes =
              await health.getHealthDataFromTypes(
                  startDateMonth, endDateMonth, typesMoveMinutes);

          // save all the new data points
          _healthDataListDayMoveMinutes.addAll(healthDataDayMoveMinutes);
          _healthDataListWeekMoveMinutes.addAll(healthDataWeekMoveMinutes);
          _healthDataListMonthMoveMinutes.addAll(healthDataMonthMoveMinutes);
        } catch (e) {}
      }

      //! filter out duplicates
      _healthDataListDaySteps =
          HealthFactory.removeDuplicates(_healthDataListDaySteps);
      _healthDataListWeekSteps =
          HealthFactory.removeDuplicates(_healthDataListWeekSteps);
      _healthDataListMonthSteps =
          HealthFactory.removeDuplicates(_healthDataListMonthSteps);

      _healthDataListDayMoveMinutes =
          HealthFactory.removeDuplicates(_healthDataListDayMoveMinutes);
      _healthDataListWeekMoveMinutes =
          HealthFactory.removeDuplicates(_healthDataListWeekMoveMinutes);
      _healthDataListMonthMoveMinutes =
          HealthFactory.removeDuplicates(_healthDataListMonthMoveMinutes);

      // Future.forEach(_healthDataList, (x) {
      //   print('');
      //   steps += x.value.round();
      // });

      //! forEach Loop Steps
      _healthDataListDaySteps.forEach((x) {
        // print("Data point: $x");
        stepsDay += (x.value.round());
      });
      _healthDataListWeekSteps.forEach((x) {
        // print("Data point: $x");
        stepsWeek += (x.value.round());
      });
      _healthDataListMonthSteps.forEach((x) {
        // print("Data point: $x");
        stepsMonth += (x.value.round());
      });

      //! forEach Loop MoveMinutes
      _healthDataListDayMoveMinutes.forEach((x) {
        // print("Data point: $x");
        moveMinutesDay += (x.value.round());
      });
      _healthDataListWeekMoveMinutes.forEach((x) {
        // print("Data point: $x");
        moveMinutesWeek += (x.value.round());
      });
      _healthDataListMonthMoveMinutes.forEach((x) {
        // print("Data point: $x");
        moveMinutesMonth += (x.value.round());
      });
      // print the results
      try {
        setState(() {
          // steps = (steps + steps / 1.8).round();
          //! Setting Steps
          stepsDay = stepsDay;
          stepsWeek = stepsWeek;
          stepsMonth = stepsMonth;

          //! Stetting Km
          stepsToKmDay = (stepsDay / 1312.33595801);
          stepsToKmWeek = stepsWeek / 1312.33595801;
          stepsToKmMonth = stepsMonth / 1312.33595801;

          //! Setting Miles
          milesDay = (stepsToKmDay / 1.609);
          milesWeek = (stepsToKmWeek / 1.609);
          milesMonth = (stepsToKmMonth / 1.609);

          //! Setting Move Minutes
          moveMinutesDay = moveMinutesDay;
          moveMinutesWeek = moveMinutesWeek;
          moveMinutesMonth = moveMinutesMonth;

          //! Setting default week values
          steps = stepsWeek;
          miles = milesWeek;
          km = stepsToKmWeek;
          moveMinutes = moveMinutesWeek;
          isTextColorDay = false;
          isTextColorWeek = true;
          isTextColorMonth = false;
          daysCountText = " (7 Days)";
        });
      } catch (e) {}

      // print("Steps Day: $stepsDay");
      // print("Steps Week: $stepsWeek");
      // print("Steps Month: $stepsMonth");
      // print("Move Minutes Day: $moveMinutesDay");
      // print("Move Minutes Week: $moveMinutesWeek");
      // print("StMove Minutesps Month: $moveMinutesMonth");
      // print("Steps: ${steps + steps / 1.8}");

      // update the UI to display the results
      // setState(() {
      //   _state =
      //       _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      // });
    } else {
      print("Authorization not granted");
      // setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Future sendWeekDataToFirebase() async {
    //! Display default date Only
    // DateTime.now().toIso8601String().split('T').first
    //! For Day
    // DateTime startDateDay = DateTime.now().subtract(Duration(days: 1));
    // DateTime endDateDay = DateTime.now();
    DateTime _firstDateOfTheDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime _lastDateOfTheDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    var startDateDay = _firstDateOfTheDay.toIso8601String().split('T').first;
    var endDateDay = _lastDateOfTheDay.toIso8601String().split('T').first;
    print("Today start Date:       " + _firstDateOfTheDay.toString());
    print("Today end Date:       " + _lastDateOfTheDay.toString());

    //! For Week
    DateTime _firstDateOfTheweek =
        DateTime.now().subtract(new Duration(days: DateTime.now().weekday - 1));
    DateTime _lastDateOfWeek = _firstDateOfTheweek.add(new Duration(days: 6));
    var startDateWeek = _firstDateOfTheweek.toIso8601String().split('T').first;
    var endDateWeek = _lastDateOfWeek.toIso8601String().split('T').first;
    print("Week start Date:       " + _firstDateOfTheweek.toString());
    print("Week end Date:       " + _lastDateOfWeek.toString());

    //! For Month
    DateTime _firstDateOfMonth =
        new DateTime(DateTime.now().year, DateTime.now().month, 1);
    DateTime _lastDateOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    var startDateMonth = _firstDateOfMonth.toIso8601String().split('T').first;
    var endDateMonth = _lastDateOfMonth.toIso8601String().split('T').first;
    print("Month start Date:       " + _firstDateOfMonth.toString());
    print("Month end Date:       " + _lastDateOfMonth.toString());

    //! Send data to Firebase
    // ignore: missing_return
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    //! MondayData Table
    await _fireStore.collection("MondayData").get().then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("MondayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Monday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("MondayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Monday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! MondayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(mondayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Monday") {
                await FirebaseFirestore.instance
                    .collection("MondayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + double.parse(mondaySteps)).toString(),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("MondayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Monday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });
    //! TuesdayData Table
    await _fireStore
        .collection("TuesdayData")
        .get()
        .then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("TuesdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Tuesday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("TuesdayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Tuesday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! TuesdayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(tuesdayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Tuesday") {
                await FirebaseFirestore.instance
                    .collection("TuesdayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + tuesdaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("TuesdayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Tuesday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });
    //! WednesdayData Table
    await _fireStore
        .collection("WednesdayData")
        .get()
        .then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("WednesdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Wednesday"
              ? stepsDay
              : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("WednesdayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Wednesday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! WednesdayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(wednesdayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Wednesday") {
                await FirebaseFirestore.instance
                    .collection("WednesdayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + wednesdaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("WednesdayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Wednesday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });

    //! ThursdayData Table
    await _fireStore
        .collection("ThursdayData")
        .get()
        .then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("ThursdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Thursday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("ThursdayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Thursday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! ThursdayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(thursdayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Thursday") {
                await FirebaseFirestore.instance
                    .collection("ThursdayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + thursdaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("ThursdayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Thursday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });

    //! FridayData Table
    await _fireStore.collection("FridayData").get().then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("FridayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Friday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("FridayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Friday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! FridayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(fridayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Friday") {
                await FirebaseFirestore.instance
                    .collection("FridayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + fridaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("FridayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Friday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });
    //! SaturdayData Table
    await _fireStore
        .collection("SaturdayData")
        .get()
        .then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("SaturdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("SaturdayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Saturday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! SaturdayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(saturdayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Saturday") {
                await FirebaseFirestore.instance
                    .collection("SaturdayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + saturdaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("SaturdayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Saturday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });
    //! SundayData Table
    await _fireStore.collection("SundayData").get().then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("SundayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Sunday"
                  ? stepsDay
                  : 0.0,
          "ReadTime": "00:00:00",
          "StartDateDay": startDateDay.toString(),
          "EndDateDay": endDateDay.toString(),
          "StartDateWeek": startDateWeek.toString(),
          "EndDateWeek": endDateWeek.toString(),
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("SundayData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                      "Sunday"
                  ? stepsDay
                  : 0.0,
              "ReadTime": "00:00:00",
              "StartDateDay": startDateDay.toString(),
              "EndDateDay": endDateDay.toString(),
              "StartDateWeek": startDateWeek.toString(),
              "EndDateWeek": endDateWeek.toString(),
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! SundayData - Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(sundayEndDateWeek) == 0) {
              //* Check if Week end date same as firebase Week end date only then add and update read time
              if (DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Sunday") {
                await FirebaseFirestore.instance
                    .collection("SundayData")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  // "Steps": (stepsDay + sundaySteps),
                  "Steps": stepsDay,
                  "StartDateDay": startDateDay.toString(),
                  "EndDateDay": endDateDay.toString(),
                }).then((value) {
                  // //* Show success pop up dialog
                  // print("Book read time updated successfully.");
                });
              }
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset and update new end date
              await FirebaseFirestore.instance
                  .collection("SundayData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "Steps": DateFormat('EEEE').format(DateTime.now()).toString() ==
                        "Sunday"
                    ? stepsDay
                    : 0.0,
                "StartDateDay": startDateDay.toString(),
                "EndDateDay": endDateDay.toString(),
                "StartDateWeek": startDateWeek.toString(),
                "EndDateWeek": endDateWeek.toString(),
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
          }
        }
        // setState(() {});
      }
    });
    //! Spliiting Data fetched from Firebase
    // splitReadTimeData();
  }

  // ignore: missing_return
  Future<DocumentSnapshot> fetchWeekDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

    await _fireStore.collection("MondayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .mondayStepsValue(result.data()['Steps']);
          mondaySteps = result.data()['Steps'];
          mondayReadTime = result.data()['ReadTime'];
          mondayStartDateDay = result.data()['StartDateDay'];
          mondayEndDateDay = result.data()['EndDateDay'];
          mondayStartDateWeek = result.data()['StartDateWeek'];
          mondayEndDateWeek = result.data()['EndDateWeek'];
          mondayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("TuesdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .tuesdayStepsValue(result.data()['Steps']);
          tuesdaySteps = result.data()['Steps'];
          tuesdayReadTime = result.data()['ReadTime'];
          tuesdayStartDateDay = result.data()['StartDateDay'];
          tuesdayEndDateDay = result.data()['EndDateDay'];
          tuesdayStartDateWeek = result.data()['StartDateWeek'];
          tuesdayEndDateWeek = result.data()['EndDateWeek'];
          tuesdayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("WednesdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .wednesdayStepsValue(result.data()['Steps']);
          wednesdaySteps = result.data()['Steps'];
          wednesdayReadTime = result.data()['ReadTime'];
          wednesdayStartDateDay = result.data()['StartDateDay'];
          wednesdayEndDateDay = result.data()['EndDateDay'];
          wednesdayStartDateWeek = result.data()['StartDateWeek'];
          wednesdayEndDateWeek = result.data()['EndDateWeek'];
          wednesdayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("ThursdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .thursdayStepsValue(result.data()['Steps']);
          thursdaySteps = result.data()['Steps'];
          thursdayReadTime = result.data()['ReadTime'];
          thursdayStartDateDay = result.data()['StartDateDay'];
          thursdayEndDateDay = result.data()['EndDateDay'];
          thursdayStartDateWeek = result.data()['StartDateWeek'];
          thursdayEndDateWeek = result.data()['EndDateWeek'];
          thursdayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("FridayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .fridayStepsValue(result.data()['Steps']);
          fridaySteps = result.data()['Steps'];
          fridayReadTime = result.data()['ReadTime'];
          fridayStartDateDay = result.data()['StartDateDay'];
          fridayEndDateDay = result.data()['EndDateDay'];
          fridayStartDateWeek = result.data()['StartDateWeek'];
          fridayEndDateWeek = result.data()['EndDateWeek'];
          fridayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("SaturdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .saturdayStepsValue(result.data()['Steps']);
          saturdaySteps = result.data()['Steps'];
          saturdayReadTime = result.data()['ReadTime'];
          saturdayStartDateDay = result.data()['StartDateDay'];
          saturdayEndDateDay = result.data()['EndDateDay'];
          saturdayStartDateWeek = result.data()['StartDateWeek'];
          saturdayEndDateWeek = result.data()['EndDateWeek'];
          saturdayUid = result.data()['Uid'];
        }
      }
    });
    await _fireStore.collection("SundayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          Provider.of<Homeprovider>(context, listen: false)
              .sundayStepsValue(result.data()['Steps']);
          sundaySteps = result.data()['Steps'];
          sundayReadTime = result.data()['ReadTime'];
          sundayStartDateDay = result.data()['StartDateDay'];
          sundayEndDateDay = result.data()['EndDateDay'];
          sundayStartDateWeek = result.data()['StartDateWeek'];
          sundayEndDateWeek = result.data()['EndDateWeek'];
          sundayUid = result.data()['Uid'];
        }
      }
    });
    setState(() {});
  }

  Future fetchDataFirebase() async {
    //! Getting read Data and wait for it to fetch the data from firebase than run other things
    await fetchWeekDataFromFirebase();
    sendWeekDataToFirebase();
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
    fetchDataFirebase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void controlDisplayData() {
    if (isDay == true) {
      setState(() {
        steps = stepsDay;
        miles = milesDay;
        km = stepsToKmDay;
        moveMinutes = moveMinutesDay;
        daysCountText = " (Today)";
      });
    } else if (isWeek == true) {
      setState(() {
        steps = stepsWeek;
        miles = milesWeek;
        km = stepsToKmWeek;
        moveMinutes = moveMinutesWeek;
        daysCountText = " (7 Days)";
      });
    } else if (isMonth == true) {
      setState(() {
        steps = stepsMonth;
        miles = milesMonth;
        km = stepsToKmMonth;
        moveMinutes = moveMinutesMonth;
        daysCountText = " (Month)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BarChartWidget(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isDay = true;
                            isWeek = false;
                            isMonth = false;
                            isTextColorDay = true;
                            isTextColorWeek = false;
                            isTextColorMonth = false;
                          });
                          controlDisplayData();
                        },
                        child: Text(
                          "Day",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isTextColorDay
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isDay = false;
                            isWeek = true;
                            isMonth = false;
                            isTextColorDay = false;
                            isTextColorWeek = true;
                            isTextColorMonth = false;
                          });
                          controlDisplayData();
                        },
                        child: Text(
                          "Week",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isTextColorWeek
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isDay = false;
                            isWeek = false;
                            isMonth = true;
                            isTextColorDay = false;
                            isTextColorWeek = false;
                            isTextColorMonth = true;
                          });
                          controlDisplayData();
                        },
                        child: Text(
                          "Month",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isTextColorMonth
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                "Assets/Images/running.png",
                                color: Colors.white,
                                height: 50,
                                //fit: BoxFit.fill,
                              ),
                              Text(
                                steps.round().toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Steps",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    "$daysCountText",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        height: 300,
                        width: 300,
                        // width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black,
                          border: Border.all(color: Colors.yellow, width: 6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: darkgrey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //! Km
                          Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "Assets/Images/fire.png",
                                  //height: 30,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 15),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: darkgrey4, width: 2),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                km.toStringAsPrecision(2) + " Km",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          //! Miles
                          Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "Assets/Images/chart.png",
                                  //height: 30,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: darkgrey4, width: 2),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                miles.toStringAsPrecision(2) + " Mi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          //! Move In Time
                          Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "Assets/Images/timer.png",
                                  color: Colors.white,
                                  //height: 30,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: darkgrey4, width: 2),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$moveMinutes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //! Weekly Reports
                  Container(
                    decoration: BoxDecoration(
                        color: darkgrey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Weekly Reports",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //! Weekly Chart
                          LineChartSample2(
                            saturdaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .saturdaySteps,
                            sundaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .saturdaySteps,
                            mondaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .mondaySteps,
                            tuesdaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .tuesdaySteps,
                            wednesdaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .wednesdaySteps,
                            thursdaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .thursdaySteps,
                            fridaySteps: Provider.of<Homeprovider>(context,
                                    listen: false)
                                .fridaySteps,
                            // saturdaySteps: double.parse(saturdaySteps),
                            // sundaySteps: double.parse(sundaySteps),
                            // mondaySteps: double.parse(mondaySteps),
                            // tuesdaySteps: double.parse(tuesdaySteps),
                            // wednesdaySteps: double.parse(wednesdaySteps),
                            // thursdaySteps: double.parse(thursdaySteps),
                            // fridaySteps: double.parse(fridaySteps),
                            // saturdaySteps: 75,
                            // sundaySteps: 0,
                            // mondaySteps: 0,
                            // tuesdaySteps: 0,
                            // wednesdaySteps: 75,
                            // thursdaySteps: 0,
                            // fridaySteps: 0,
                          ),
                          // Card(
                          //   elevation: 4,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(32),
                          //   ),
                          //   color: const Color(0xff020227),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 16),
                          //     child: Expanded(
                          //       child: BarChartWidget(),
                          //     ),
                          //   ),
                          // ),
                          // Text(
                          //   "Lorem ipsum dolor sit amet, consetetur sadscing elitr, sed diam nonumy eirmod.",
                          //   textAlign: TextAlign.start,
                          //   style: TextStyle(
                          //     color: darkgrey4,
                          //     fontWeight: FontWeight.bold,
                          //     //fontSize: 16,
                          //   ),
                          // ),
                          // SizedBox(
                          //   child: ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(10),
                          //         child: Image.network(
                          //           "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                          //           //fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(10),
                          //         child: Image.network(
                          //             "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                          //       )
                          //     ],
                          //   ),
                          //   height: 130,
                          // )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //! Daily Bonus Walk
                  Container(
                    decoration: BoxDecoration(
                        color: darkgrey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Daily Bonus",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   "Lorem ipsum dolor sit amet, consetetur sadscing elitr, sed diam nonumy eirmod.",
                          //   textAlign: TextAlign.start,
                          //   style: TextStyle(
                          //     color: darkgrey4,
                          //     fontWeight: FontWeight.bold,
                          //     //fontSize: 16,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: darkgrey3,
                                        size: 50,
                                      ),
                                    ),
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: darkgrey2,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.lock,
                                                  color: darkgrey3,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "Assets/Images/running.png",
                                                    color: darkgrey3,
                                                    height: 30,

                                                    //fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    width: 60,
                                                    child: Divider(
                                                      color: darkgrey3,
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1000",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: darkgrey2,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Container(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: Icon(
                                                    Icons.lock,
                                                    color: darkgrey3,
                                                    size: 30,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "Assets/Images/running.png",
                                                      color: darkgrey3,
                                                      height: 30,

                                                      //fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                      child: Divider(
                                                        color: darkgrey3,
                                                        thickness: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      "1500",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkgrey3,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: darkgrey2,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height: 130,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
