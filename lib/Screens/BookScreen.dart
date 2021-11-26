import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatefulWidget {
  BookScreen({Key key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfViewerController _pdfViewerController;
  // int readTimer = 0;
  //! getDisplayTime Variables Control
  final _isHours = true;
  final _isMinutes = true;
  final _isSeconds = true;
  final _isMilliSeconds = false;
  var readTimer;
  var value;

  var pagesDay;
  var pagesWeek;
  var pagesMonth;

  var readTimeDay;
  var readTimeWeek;
  var readTimeMonth;
  var readPagesDay;
  var readPagesWeek;
  var readPagesMonth;
  var readStartDateDay;
  var readEndDateDay;
  var readStartDateWeek;
  var readEndDateWeek;
  var readStartDateMonth;
  var readEndDateMonth;
  var readTotalTime;
  var readTotalPages;
  var readUid;

  var readTimerDay;
  var readTimerWeek;
  var readTimerMonth;
  var readTimerMonday;
  var readTimerTuesday;
  var readTimerWednesday;
  var readTimerThursday;
  var readTimerFriday;
  var readTimerSaturday;
  var readTimerSunday;

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

  int fetchedSplittedHoursDay;
  int fetchedSplittedMinutesDay;
  int fetchedSplittedSecondsDay;

  int fetchedSplittedHoursWeek;
  int fetchedSplittedMinutesWeek;
  int fetchedSplittedSecondsWeek;

  int fetchedSplittedHoursMonth;
  int fetchedSplittedMinutesMonth;
  int fetchedSplittedSecondsMonth;

  int fetchedSplittedHoursTotalTime;
  int fetchedSplittedMinutesTotalTime;
  int fetchedSplittedSecondsTotalTime;

  int fetchedSplittedHoursReadTimer;
  int fetchedSplittedMinutesReadTimer;
  int fetchedSplittedSecondsReadTimer;

  int splittedHoursReadTimer;
  int splittedMinutesReadTimer;
  int splittedSecondsReadTimer;

  int fetchedSplittedHoursMondayReadTime;
  int fetchedSplittedMinutesMondayReadTime;
  int fetchedSplittedSecondsMondayReadTime;

  int fetchedSplittedHoursTuesdayReadTime;
  int fetchedSplittedMinutesTuesdayReadTime;
  int fetchedSplittedSecondsTuesdayReadTime;

  int fetchedSplittedHoursWednesdayReadTime;
  int fetchedSplittedMinutesWednesdayReadTime;
  int fetchedSplittedSecondsWednesdayReadTime;

  int fetchedSplittedHoursThursdayReadTime;
  int fetchedSplittedMinutesThursdayReadTime;
  int fetchedSplittedSecondsThursdayReadTime;

  int fetchedSplittedHoursFridayReadTime;
  int fetchedSplittedMinutesFridayReadTime;
  int fetchedSplittedSecondsFridayReadTime;

  int fetchedSplittedHoursSaturdayReadTime;
  int fetchedSplittedMinutesSaturdayReadTime;
  int fetchedSplittedSecondsSaturdayReadTime;

  int fetchedSplittedHoursSundayReadTime;
  int fetchedSplittedMinutesSundayReadTime;
  int fetchedSplittedSecondsSundayReadTime;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  // ignore: missing_return
  Future<DocumentSnapshot> fetchDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("ReadData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            readTimeDay = result.data()['ReadTimeDay'];
            readTimeWeek = result.data()['ReadTimeWeek'];
            readTimeMonth = result.data()['ReadTimeMonth'];
            readPagesDay = result.data()['ReadPagesDay'];
            readPagesWeek = result.data()['ReadPagesWeek'];
            readPagesMonth = result.data()['ReadPagesMonth'];
            readStartDateDay = result.data()['ReadStartDateDay'];
            readEndDateDay = result.data()['ReadEndDateDay'];
            readStartDateWeek = result.data()['ReadStartDateWeek'];
            readEndDateWeek = result.data()['ReadEndDateWeek'];
            readStartDateMonth = result.data()['ReadStartDateMonth'];
            readEndDateMonth = result.data()['ReadEndDateMonth'];
            readTotalTime = result.data()['ReadTotalTime'];
            readTotalPages = result.data()['ReadTotalPages'];
            readUid = result.data()['Uid'];
          });
        }
      }
    });
  }

  splitReadTimeData() {
    //! Splitting String by :
    List<String> fetchedSplittedReadTimeDay = readTimeDay.split(':');
    fetchedSplittedHoursDay = int.parse(fetchedSplittedReadTimeDay[0]);
    fetchedSplittedMinutesDay = int.parse(fetchedSplittedReadTimeDay[1]);
    fetchedSplittedSecondsDay = int.parse(fetchedSplittedReadTimeDay[2]);

    //! Splitting String by :
    List<String> fetchedSplittedReadTimeWeek = readTimeWeek.split(':');
    fetchedSplittedHoursWeek = int.parse(fetchedSplittedReadTimeWeek[0]);
    fetchedSplittedMinutesWeek = int.parse(fetchedSplittedReadTimeWeek[1]);
    fetchedSplittedSecondsWeek = int.parse(fetchedSplittedReadTimeWeek[2]);

    //! Splitting String by :
    List<String> fetchedSplittedReadTimeMonth = readTimeMonth.split(':');
    fetchedSplittedHoursMonth = int.parse(fetchedSplittedReadTimeMonth[0]);
    fetchedSplittedMinutesMonth = int.parse(fetchedSplittedReadTimeMonth[1]);
    fetchedSplittedSecondsMonth = int.parse(fetchedSplittedReadTimeMonth[2]);

    //! Splitting String by :
    List<String> fetchedSplittedReadTotalTime = readTotalTime.split(':');
    fetchedSplittedHoursTotalTime = int.parse(fetchedSplittedReadTotalTime[0]);
    fetchedSplittedMinutesTotalTime =
        int.parse(fetchedSplittedReadTotalTime[1]);
    fetchedSplittedSecondsTotalTime =
        int.parse(fetchedSplittedReadTotalTime[2]);

    //! Splitting String by :
    List<String> splittedReadTimer = readTimer.split(':');
    splittedHoursReadTimer = int.parse(splittedReadTimer[0]);
    splittedMinutesReadTimer = int.parse(splittedReadTimer[1]);
    splittedSecondsReadTimer = int.parse(splittedReadTimer[2]);

    //! Splitting String by :
    List<String> splittedMondayReadTime = mondayReadTime.split(':');
    fetchedSplittedHoursMondayReadTime = int.parse(splittedMondayReadTime[0]);
    fetchedSplittedMinutesMondayReadTime = int.parse(splittedMondayReadTime[1]);
    fetchedSplittedSecondsMondayReadTime = int.parse(splittedMondayReadTime[2]);

    //! Splitting String by :
    List<String> splittedTuesdayReadTime = tuesdayReadTime.split(':');
    fetchedSplittedHoursTuesdayReadTime = int.parse(splittedTuesdayReadTime[0]);
    fetchedSplittedMinutesTuesdayReadTime =
        int.parse(splittedTuesdayReadTime[1]);
    fetchedSplittedSecondsTuesdayReadTime =
        int.parse(splittedTuesdayReadTime[2]);

    //! Splitting String by :
    List<String> splittedWednessdayReadTime = wednesdayReadTime.split(':');
    fetchedSplittedHoursWednesdayReadTime =
        int.parse(splittedWednessdayReadTime[0]);
    fetchedSplittedMinutesWednesdayReadTime =
        int.parse(splittedWednessdayReadTime[1]);
    fetchedSplittedSecondsWednesdayReadTime =
        int.parse(splittedWednessdayReadTime[2]);

    //! Splitting String by :
    List<String> splittedThursdayReadTime = thursdayReadTime.split(':');
    fetchedSplittedHoursThursdayReadTime =
        int.parse(splittedThursdayReadTime[0]);
    fetchedSplittedMinutesThursdayReadTime =
        int.parse(splittedThursdayReadTime[1]);
    fetchedSplittedSecondsThursdayReadTime =
        int.parse(splittedThursdayReadTime[2]);

    //! Splitting String by :
    List<String> splittedFridayReadTime = fridayReadTime.split(':');
    fetchedSplittedHoursFridayReadTime = int.parse(splittedFridayReadTime[0]);
    fetchedSplittedMinutesFridayReadTime = int.parse(splittedFridayReadTime[1]);
    fetchedSplittedSecondsFridayReadTime = int.parse(splittedFridayReadTime[2]);

    //! Splitting String by :
    List<String> splittedSaturdayReadTime = saturdayReadTime.split(':');
    fetchedSplittedHoursSaturdayReadTime =
        int.parse(splittedSaturdayReadTime[0]);
    fetchedSplittedMinutesSaturdayReadTime =
        int.parse(splittedSaturdayReadTime[1]);
    fetchedSplittedSecondsSaturdayReadTime =
        int.parse(splittedSaturdayReadTime[2]);

    //! Splitting String by :
    List<String> splittedSundayReadTime = sundayReadTime.split(':');
    fetchedSplittedHoursSundayReadTime = int.parse(splittedSundayReadTime[0]);
    fetchedSplittedMinutesSundayReadTime = int.parse(splittedSundayReadTime[1]);
    fetchedSplittedSecondsSundayReadTime = int.parse(splittedSundayReadTime[2]);
  }

  timeAddLogic(String day) {
    if (day == "Day") {
      int seconds = fetchedSplittedSecondsDay + splittedSecondsReadTimer;
      int minutes = fetchedSplittedMinutesDay + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursDay + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerDay = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }

    if (day == "Week") {
      int seconds = fetchedSplittedSecondsWeek + splittedSecondsReadTimer;
      int minutes = fetchedSplittedMinutesWeek + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursWeek + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerWeek = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }

    if (day == "Month") {
      int seconds = fetchedSplittedSecondsMonth + splittedSecondsReadTimer;
      int minutes = fetchedSplittedMinutesMonth + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursMonth + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerMonth = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }

    if (day == "Monday") {
      int seconds =
          fetchedSplittedSecondsMondayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesMondayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursMondayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerMonday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Tuesday") {
      int seconds =
          fetchedSplittedSecondsTuesdayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesTuesdayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursTuesdayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerTuesday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Wednesday") {
      int seconds =
          fetchedSplittedSecondsWednesdayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesWednesdayReadTime + splittedMinutesReadTimer;
      int hours =
          fetchedSplittedHoursWednesdayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerWednesday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Thursday") {
      int seconds =
          fetchedSplittedSecondsThursdayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesThursdayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursThursdayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerThursday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Friday") {
      int seconds =
          fetchedSplittedSecondsFridayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesFridayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursFridayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerFriday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Saturday") {
      int seconds =
          fetchedSplittedSecondsSaturdayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesSaturdayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursSaturdayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerSaturday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
    if (day == "Sunday") {
      int seconds =
          fetchedSplittedSecondsSundayReadTime + splittedSecondsReadTimer;
      int minutes =
          fetchedSplittedMinutesSundayReadTime + splittedMinutesReadTimer;
      int hours = fetchedSplittedHoursSundayReadTime + splittedHoursReadTimer;
      if (seconds >= 60) {
        minutes += 1;
        seconds = seconds - 60;
        if (minutes >= 60) {
          hours += 1;
          minutes = minutes - 60;
        }
      }
      readTimerSunday = hours.toString() +
          ":" +
          minutes.toString() +
          ":" +
          seconds.toString();
    }
  }

  Future sendDataToFirebase() async {
    //! Spliiting Data fetched from Firebase
    if (readUid != null) {
      splitReadTimeData();
    }

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
    await _fireStore.collection("ReadData").get().then((querySnapshot) async {
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("ReadData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "ReadTimeDay": readTimer,
          "ReadTimeWeek": readTimer,
          "ReadTimeMonth": readTimer,
          "ReadPagesDay": _pdfViewerController.pageNumber,
          "ReadPagesWeek": _pdfViewerController.pageNumber,
          "ReadPagesMonth": _pdfViewerController.pageNumber,
          "ReadStartDateDay": startDateDay.toString(),
          "ReadEndDateDay": endDateDay.toString(),
          "ReadStartDateWeek": startDateWeek.toString(),
          "ReadEndDateWeek": endDateWeek.toString(),
          "ReadStartDateMonth": startDateMonth.toString(),
          "ReadEndDateMonth": endDateMonth.toString(),
          "ReadTotalTime": readTimer,
          "ReadTotalPages": _pdfViewerController.pageNumber,
          "Uid": FirebaseAuth.instance.currentUser.uid,
        }).then((value) {});
      } else if (querySnapshot.docs.isNotEmpty) {
        //* If table exists but Uid/User not exists.
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid != result.data()['Uid']) {
            FirebaseFirestore.instance
                .collection("ReadData")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              "ReadTimeDay": readTimer,
              "ReadTimeWeek": readTimer,
              "ReadTimeMonth": readTimer,
              "ReadPagesDay": _pdfViewerController.pageNumber,
              "ReadPagesWeek": _pdfViewerController.pageNumber,
              "ReadPagesMonth": _pdfViewerController.pageNumber,
              "ReadStartDateDay": startDateDay.toString(),
              "ReadEndDateDay": endDateDay.toString(),
              "ReadStartDateWeek": startDateWeek.toString(),
              "ReadEndDateWeek": endDateWeek.toString(),
              "ReadStartDateMonth": startDateMonth.toString(),
              "ReadEndDateMonth": endDateMonth.toString(),
              "ReadTotalTime": readTimer,
              "ReadTotalPages": _pdfViewerController.pageNumber,
              "Uid": FirebaseAuth.instance.currentUser.uid,
            }).then((value) {});
            //* If table exists also User, update it.
          } else if (FirebaseAuth.instance.currentUser.uid ==
              result.data()['Uid']) {
            //! Logic Of endDateDay before updating...
            if (endDateDay.compareTo(readEndDateDay) == 0) {
              // print('true');
              timeAddLogic("Day");
              //* Check if Today's end date same as firebase Today's end date only then add and update read time
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                // "ReadTimeDay": readTimer.add(Duration(
                //   hours: fetchedSplittedHoursDay,
                //   minutes: fetchedSplittedMinutesDay,
                //   seconds: fetchedSplittedSecondsDay,
                // )),
                "ReadTimeDay": readTimerDay,
                "ReadTotalTime": readTimerDay,
                "ReadPagesDay": readPagesDay + _pdfViewerController.pageNumber,
                "ReadTotalPages":
                    readTotalPages + _pdfViewerController.pageNumber,
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            } else {
              // print('false');
              //* Check if Today's end date is not same as firebase Today's end date only then update new date
              //* Because now it is a new day. So, reset read time and update new end date
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "ReadTimeDay": "00:00:00",
                "ReadStartDateDay": startDateDay,
                "ReadEndDateDay": endDateDay,
                "ReadPagesDay": "0",
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
            //! Logic Of endDateWeek before updating...
            if (endDateWeek.compareTo(readEndDateWeek) == 0) {
              // print('true');
              timeAddLogic("Week");
              //* Check if Week end date same as firebase Week end date only then add and update read time
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "ReadTimeWeek": readTimerWeek,
                "ReadTotalTime": readTimerWeek,
                "ReadPagesWeek":
                    readPagesWeek + _pdfViewerController.pageNumber,
                "ReadTotalPages":
                    readTotalPages + _pdfViewerController.pageNumber,
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            } else {
              // print('false');
              //* Check if Week end date is not same as firebase Week end date only then update new date
              //* Because now it is a new Week. So, reset read time and update new end date
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "ReadTimeWeek": "00:00:00",
                "ReadStartDateWeek": startDateWeek,
                "ReadEndDateWeek": endDateWeek,
                "ReadPagesWeek": "0",
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            }
            //! Logic Of endDateMonth before updating...
            if (endDateMonth.compareTo(readEndDateMonth) == 0) {
              // print('true');
              timeAddLogic("Month");
              //* Check if Month end date same as firebase Month end date only then add and update read time
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "ReadTimeMonth": readTimerMonth,
                "ReadTotalTime": readTimerMonth,
                "ReadPagesMonth":
                    readPagesMonth + _pdfViewerController.pageNumber,
                "ReadTotalPages":
                    readTotalPages + _pdfViewerController.pageNumber,
              }).then((value) {
                // //* Show success pop up dialog
                // print("Book read time updated successfully.");
              });
            } else {
              // print('false');
              //* Check if Month end date is not same as firebase Month end date only then update new date
              //* Because now it is a new Month. So, reset read time and update new end date
              await FirebaseFirestore.instance
                  .collection("ReadData")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .update({
                "ReadTimeMonth": "00:00:00",
                "ReadStartDateMonth": startDateMonth,
                "ReadEndDateMonth": endDateMonth,
                "ReadPagesMonth": "0",
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
          setState(() {
            mondaySteps = result.data()['Steps'];
            mondayReadTime = result.data()['ReadTime'];
            mondayStartDateDay = result.data()['StartDateDay'];
            mondayEndDateDay = result.data()['EndDateDay'];
            mondayStartDateWeek = result.data()['StartDateWeek'];
            mondayEndDateWeek = result.data()['EndDateWeek'];
            mondayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("TuesdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            tuesdaySteps = result.data()['Steps'];
            tuesdayReadTime = result.data()['ReadTime'];
            tuesdayStartDateDay = result.data()['StartDateDay'];
            tuesdayEndDateDay = result.data()['EndDateDay'];
            tuesdayStartDateWeek = result.data()['StartDateWeek'];
            tuesdayEndDateWeek = result.data()['EndDateWeek'];
            tuesdayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("WednesdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            wednesdaySteps = result.data()['Steps'];
            wednesdayReadTime = result.data()['ReadTime'];
            wednesdayStartDateDay = result.data()['StartDateDay'];
            wednesdayEndDateDay = result.data()['EndDateDay'];
            wednesdayStartDateWeek = result.data()['StartDateWeek'];
            wednesdayEndDateWeek = result.data()['EndDateWeek'];
            wednesdayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("ThursdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            thursdaySteps = result.data()['Steps'];
            thursdayReadTime = result.data()['ReadTime'];
            thursdayStartDateDay = result.data()['StartDateDay'];
            thursdayEndDateDay = result.data()['EndDateDay'];
            thursdayStartDateWeek = result.data()['StartDateWeek'];
            thursdayEndDateWeek = result.data()['EndDateWeek'];
            thursdayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("FridayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            fridaySteps = result.data()['Steps'];
            fridayReadTime = result.data()['ReadTime'];
            fridayStartDateDay = result.data()['StartDateDay'];
            fridayEndDateDay = result.data()['EndDateDay'];
            fridayStartDateWeek = result.data()['StartDateWeek'];
            fridayEndDateWeek = result.data()['EndDateWeek'];
            fridayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("SaturdayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            saturdaySteps = result.data()['Steps'];
            saturdayReadTime = result.data()['ReadTime'];
            saturdayStartDateDay = result.data()['StartDateDay'];
            saturdayEndDateDay = result.data()['EndDateDay'];
            saturdayStartDateWeek = result.data()['StartDateWeek'];
            saturdayEndDateWeek = result.data()['EndDateWeek'];
            saturdayUid = result.data()['Uid'];
          });
        }
      }
    });
    await _fireStore.collection("SundayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          setState(() {
            sundaySteps = result.data()['Steps'];
            sundayReadTime = result.data()['ReadTime'];
            sundayStartDateDay = result.data()['StartDateDay'];
            sundayEndDateDay = result.data()['EndDateDay'];
            sundayStartDateWeek = result.data()['StartDateWeek'];
            sundayEndDateWeek = result.data()['EndDateWeek'];
            sundayUid = result.data()['Uid'];
          });
        }
      }
    });
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
      timeAddLogic("Monday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("MondayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Monday"
                  ? readTimerMonday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Monday"
                      ? readTimerMonday
                      : "00:00:00",
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
                  "ReadTime": readTimerMonday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Monday"
                        ? readTimerMonday
                        : "00:00:00",
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
      timeAddLogic("Tuesday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("TuesdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Tuesday"
                  ? readTimerTuesday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Tuesday"
                      ? readTimerTuesday
                      : "00:00:00",
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
                  "ReadTime": readTimerTuesday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Tuesday"
                        ? readTimerTuesday
                        : "00:00:00",
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
      timeAddLogic("Wednesday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("WednesdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime": DateFormat('EEEE').format(DateTime.now()).toString() ==
                  "Wednesday"
              ? readTimerWednesday
              : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Wednesday"
                      ? readTimerWednesday
                      : "00:00:00",
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
                  "ReadTime": readTimerWednesday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Wednesday"
                        ? readTimerWednesday
                        : "00:00:00",
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
      timeAddLogic("Thursday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("ThursdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Thursday"
                  ? readTimerThursday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Thursday"
                      ? readTimerThursday
                      : "00:00:00",
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
                  "ReadTime": readTimerThursday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Thursday"
                        ? readTimerThursday
                        : "00:00:00",
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
      timeAddLogic("Friday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("FridayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Friday"
                  ? readTimerFriday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Friday"
                      ? readTimerFriday
                      : "00:00:00",
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
                  "ReadTime": readTimerFriday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Friday"
                        ? readTimerFriday
                        : "00:00:00",
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
      timeAddLogic("Saturday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("SaturdayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"
                  ? readTimerSaturday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Saturday"
                      ? readTimerSaturday
                      : "00:00:00",
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
                  "ReadTime": readTimerSaturday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Saturday"
                        ? readTimerSaturday
                        : "00:00:00",
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
      timeAddLogic("Sunday");
      //* Check if Collection / Table exists or not
      //* Only runs for the first time if table not exists
      if (querySnapshot.docs.isEmpty) {
        // collection doesnt exist
        // then create
        FirebaseFirestore.instance
            .collection("SundayData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "Steps": "0",
          "ReadTime":
              DateFormat('EEEE').format(DateTime.now()).toString() == "Sunday"
                  ? readTimerSunday
                  : "00:00:00",
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
              "Steps": "0",
              "ReadTime":
                  DateFormat('EEEE').format(DateTime.now()).toString() ==
                          "Sunday"
                      ? readTimerSunday
                      : "00:00:00",
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
                  "ReadTime": readTimerSunday,
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
                "ReadTime":
                    DateFormat('EEEE').format(DateTime.now()).toString() ==
                            "Sunday"
                        ? readTimerSunday
                        : "00:00:00",
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

  Future fetchDataFirebase() async {
    //! Getting read Data and wait for it to fetch the data from firebase than run other things
    await fetchWeekDataFromFirebase();
    sendDataToFirebase();
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase();
    _pdfViewerController = PdfViewerController();
    startStopWatch();
  }

  @override
  void dispose() async {
    super.dispose();
    await sendDataToFirebase();
    await fetchDataFirebase();
    await _stopWatchTimer.dispose();
  }

  void startTimer() {
    // const onsec = Duration(seconds: 1);
    // Timer.periodic(onsec, (timer) {
    //   setState(() {
    //     readTimer += 1;
    //   });
    // });
  }

  //! To start stopwatch for read time
  void startStopWatch() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  //! To stop stopwatch for read time
  void stopStopWatch() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    readTimer = StopWatchTimer.getDisplayTime(
      value,
      hours: _isHours,
      minute: _isMinutes,
      second: _isSeconds,
      milliSecond: _isMilliSeconds,
    ).toString();
  }

  //! To reset stopwatch for read time
  void resetStopWatch() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset(
                    "Assets/Images/ClockIcon.png",
                    width: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      value = snap.data;
                      readTimer = StopWatchTimer.getDisplayTime(
                        value,
                        hours: _isHours,
                        minute: _isMinutes,
                        second: _isSeconds,
                        milliSecond: _isMilliSeconds,
                      );
                      return Column(
                        children: <Widget>[
                          //! Actual Stopwatch Timer
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              readTimer,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: SfPdfViewer.network(
            'http://www.passuneb.com/elibrary/ebooks/Harry%20Potter%20and%20The%20Sorcerer%E2%80%99s%20Stone.pdf',
            key: _pdfViewerKey,
            controller: _pdfViewerController,
          ),
        ),
      ),
    );
  }
}
