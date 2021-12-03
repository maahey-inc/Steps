import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Screens/AllBooksCategoriesScreen.dart';
import 'package:steps_app/Screens/BookScreen.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/Widgets/LineChart.dart';
import 'package:steps_app/Widgets/ReadLineChart.dart';

import '../theme.dart';

class Readmainscreen extends StatefulWidget {
  @override
  State<Readmainscreen> createState() => _ReadmainscreenState();
}

class _ReadmainscreenState extends State<Readmainscreen> {
  var pagesDay;
  var pagesWeek;
  var pagesMonth;

  var hours = "0";
  var minutes = "0";
  var seconds = "0";
  var pages = "0";
  var totalTime = "0";
  var totalPages = "0";

  bool isDay = false;
  bool isWeek = false;
  bool isMonth = false;

  bool isTextColorDay = false;
  bool isTextColorWeek = false;
  bool isTextColorMonth = false;

  String daysCountText = "";

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    sendDataToFirebase();
    fetchDataFirebase();
    // print("${Provider.of<Homeprovider>(context, listen: false).readTimeValue}");
  }

  Future sendDataToFirebase() async {
    //! Spliiting Data fetched from Firebase
    // if (readUid != null) {
    //   splitReadTimeData();
    // }

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
      //just add this line

      if (querySnapshot.docs.isEmpty) {
        CircularProgressIndicator();
      } else {
        if (querySnapshot.docs.isNotEmpty) {
          //* If table exists but Uid/User not exists.
          for (var result in querySnapshot.docs) {
            if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
              //! Logic Of endDateDay before updating...
              if (readEndDateDay == null) {
                // Do Nothing...
              } else {
                if (endDateDay.compareTo(readEndDateDay) == 0) {
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
              }
              //! Logic Of endDateWeek before updating...
              if (readEndDateWeek == null) {
                // Do Nothing...
              } else {
                if (endDateWeek.compareTo(readEndDateWeek) == 0) {
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
              }
              //! Logic Of endDateMonth before updating...
              if (readEndDateMonth == null) {
                // Do Nothing...
              } else {
                if (endDateMonth.compareTo(readEndDateMonth) == 0) {
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
          }
          // setState(() {});
        }
      }
    });
    fetchDataFromFirebase();
    if (mounted) {
      setState(() {});
    }
    //! Spliiting Data fetched from Firebase
    // splitReadTimeData();
  }

  // ignore: missing_return
  Future<DocumentSnapshot> fetchDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("ReadData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          if (mounted) {
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
      }
    });
  }

  // ignore: missing_return
  Future<DocumentSnapshot> fetchWeekDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    if (mounted) {
      await _fireStore.collection("MondayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("TuesdayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("WednesdayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("ThursdayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("FridayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("SaturdayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });
      await _fireStore.collection("SundayData").get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            if (mounted) {
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
        }
      });

      //! Splitting String by :
      if (mounted) {
        List<String> splittedMondayReadTime = mondayReadTime.split(':');
        fetchedSplittedHoursMondayReadTime =
            int.parse(splittedMondayReadTime[0]);
        fetchedSplittedMinutesMondayReadTime =
            int.parse(splittedMondayReadTime[1]);
        fetchedSplittedSecondsMondayReadTime =
            int.parse(splittedMondayReadTime[2]);

        //! Splitting String by :
        List<String> splittedTuesdayReadTime = tuesdayReadTime.split(':');
        fetchedSplittedHoursTuesdayReadTime =
            int.parse(splittedTuesdayReadTime[0]);
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
        fetchedSplittedHoursFridayReadTime =
            int.parse(splittedFridayReadTime[0]);
        fetchedSplittedMinutesFridayReadTime =
            int.parse(splittedFridayReadTime[1]);
        fetchedSplittedSecondsFridayReadTime =
            int.parse(splittedFridayReadTime[2]);

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
        fetchedSplittedHoursSundayReadTime =
            int.parse(splittedSundayReadTime[0]);
        fetchedSplittedMinutesSundayReadTime =
            int.parse(splittedSundayReadTime[1]);
        fetchedSplittedSecondsSundayReadTime =
            int.parse(splittedSundayReadTime[2]);

        //! Logic to display in minutes: Hours * 60 + Minutes = Total Minutes
        double totalMinutesMonday = (fetchedSplittedHoursMondayReadTime * 60 +
                fetchedSplittedMinutesMondayReadTime)
            .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .mondayReadMinutesValue(totalMinutesMonday);
        print("TotalMinutesMonday        " + totalMinutesMonday.toString());
        double totalMinutesTuesday = (fetchedSplittedHoursTuesdayReadTime * 60 +
                fetchedSplittedMinutesTuesdayReadTime)
            .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .tuesdayReadMinutesValue(totalMinutesTuesday);
        double totalMinutesWednesday =
            (fetchedSplittedHoursWednesdayReadTime * 60 +
                    fetchedSplittedMinutesWednesdayReadTime)
                .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .wednesdayReadMinutesValue(totalMinutesWednesday);
        double totalMinutesThursday =
            (fetchedSplittedHoursThursdayReadTime * 60 +
                    fetchedSplittedMinutesThursdayReadTime)
                .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .thursdayReadMinutesValue(totalMinutesThursday);
        double totalMinutesFriday = (fetchedSplittedHoursFridayReadTime * 60 +
                fetchedSplittedMinutesFridayReadTime)
            .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .fridayReadMinutesValue(totalMinutesFriday);
        double totalMinutesSaturday =
            (fetchedSplittedHoursSaturdayReadTime * 60 +
                    fetchedSplittedMinutesSaturdayReadTime)
                .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .saturdayReadMinutesValue(totalMinutesSaturday);
        double totalMinutesSunday = (fetchedSplittedHoursSundayReadTime * 60 +
                fetchedSplittedMinutesSundayReadTime)
            .toDouble();
        Provider.of<Homeprovider>(context, listen: false)
            .sundayReadMinutesValue(totalMinutesSunday);
        setState(() {});
      }
    }
  }

  splitReadTimeData() {
    // print("HELLOOOO from the Other World!!!! ");
    //! Splitting String by :
    List<String> fetchedSplittedReadTimeDay = readTimeDay.split(':');
    fetchedSplittedHoursDay = int.parse(fetchedSplittedReadTimeDay[0]);
    fetchedSplittedMinutesDay = int.parse(fetchedSplittedReadTimeDay[1]);
    fetchedSplittedSecondsDay = int.parse(fetchedSplittedReadTimeDay[2]);
    // print("fetchedSplittedHoursDay:     " + fetchedSplittedHoursDay.toString());
    // print("fetchedSplittedMinutesDay:     " +
    //     fetchedSplittedMinutesDay.toString());
    // print("fetchedSplittedSecondsDay:     " +
    //     fetchedSplittedSecondsDay.toString());

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
    if (mounted) {
      setState(() {});
    }
  }

  Future fetchDataFirebase() async {
    //! Getting read Data and wait for it to fetch the data from firebase than run other things
    await fetchWeekDataFromFirebase();
  }

  void controlDisplayData() {
    //! Logic to display in minutes: Hours * 60 + Minutes = Total Minutes
    if (isDay == true) {
      if (readUid != null) {
        splitReadTimeData();
        setState(() {
          int totalMinutesDay =
              fetchedSplittedHoursDay * 60 + fetchedSplittedMinutesDay;
          minutes = totalMinutesDay.toString();
          int totalOverallMinutes = fetchedSplittedHoursTotalTime * 60 +
              fetchedSplittedMinutesTotalTime;
          totalTime = totalOverallMinutes.toString();
          pages = readPagesDay.toString();
          daysCountText = " (Today)";
        });
      } else {
        setState(() {
          daysCountText = " (Today)";
        });
      }
    } else if (isWeek == true) {
      if (readUid != null) {
        splitReadTimeData();
        setState(() {
          int totalMinutesWeek =
              fetchedSplittedHoursWeek * 60 + fetchedSplittedMinutesWeek;
          minutes = totalMinutesWeek.toString();
          int totalOverallMinutes = fetchedSplittedHoursTotalTime * 60 +
              fetchedSplittedMinutesTotalTime;
          totalTime = totalOverallMinutes.toString();
          pages = readPagesWeek.toString();
          daysCountText = " (7 Days)";
        });
      } else {
        setState(() {
          daysCountText = " (7 Days)";
        });
      }
    } else if (isMonth == true) {
      if (readUid != null) {
        splitReadTimeData();
        setState(() {
          int totalMinutesMonth =
              fetchedSplittedHoursMonth * 60 + fetchedSplittedMinutesMonth;
          minutes = totalMinutesMonth.toString();
          int totalOverallMinutes = fetchedSplittedHoursTotalTime * 60 +
              fetchedSplittedMinutesTotalTime;
          totalTime = totalOverallMinutes.toString();
          pages = readPagesMonth.toString();
          daysCountText = " (Month)";
        });
      } else {
        setState(() {
          daysCountText = " (Month)";
        });
      }
    }
  }

  Future fetchData() async {
    //! Getting read Data and wait for it to fetch the data from firebase than run other things
    await fetchDataFromFirebase();
    if (readUid != null) {
      //! Spliiting Data fetched from Firebase
      splitReadTimeData();
      int totalMinutesWeek =
          fetchedSplittedHoursWeek * 60 + fetchedSplittedMinutesWeek;
      int totalOverallMinutes =
          fetchedSplittedHoursTotalTime * 60 + fetchedSplittedMinutesTotalTime;
      setState(() {
        //! Setting default week values
        minutes = totalMinutesWeek.toString();
        totalTime = totalOverallMinutes.toString();
        pages = readPagesWeek.toString();
        isTextColorDay = false;
        isTextColorWeek = true;
        isTextColorMonth = false;
        daysCountText = " (7 Days)";
      });

      //! Show data
      // controlDisplayData();
    } else {
      if (mounted) {
        setState(() {
          //! Setting default week values
          minutes = "0";
          totalTime = "0";
          pages = "0";
          isTextColorDay = false;
          isTextColorWeek = true;
          isTextColorMonth = false;
          daysCountText = " (7 Days)";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              "Assets/Images/book.png",
                              color: Colors.white,
                              height: 50,
                              //fit: BoxFit.fill,
                            ),
                            Text(
                              "$minutes m",
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
                                  "Reading",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 33,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //! Read Time
                        Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "Assets/Images/timer.png",
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
                              "$totalTime min",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        //! Miles
                        // Column(
                        //   children: [
                        //     Container(
                        //       child: Image.asset(
                        //         "Assets/Images/chart.png",
                        //         //height: 30,
                        //       ),
                        //       padding: EdgeInsets.symmetric(
                        //           vertical: 12, horizontal: 12),
                        //       decoration: BoxDecoration(
                        //           border:
                        //               Border.all(color: darkgrey4, width: 2),
                        //           borderRadius: BorderRadius.circular(25)),
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text(
                        //       "1.2 Mi",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        //! Page Reads
                        Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "Assets/Images/read.png",
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
                              "$pages pg",
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
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
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
                        ReadLineChart(
                            // saturdaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .saturdayReadMinutes,
                            // sundaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .sundayReadMinutes,
                            // mondaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .mondayReadMinutes,
                            // tuesdaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .tuesdayReadMinutes,
                            // wednesdaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .wednesdayReadMinutes,
                            // thursdaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .thursdayReadMinutes,
                            // fridaySteps:
                            //     Provider.of<Homeprovider>(context, listen: false)
                            //         .fridayReadMinutes,
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
                //! Read to Gain
                Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
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
                                "Read To Gain",
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
                        //   "Lorem ipsum dolor sit et, ntur sadipscing Elitr, Sed Diam",
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: darkgrey4,
                        //   ),
                        // ),
                        SizedBox(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => BookScreen()));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllBooksCategoriesScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(
                                        "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg",
                                        //fit: BoxFit.cover,
                                      ),
                              
                                      //Text("anajndj"),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.4),
                                          // height: 100,
                                        ),
                                      ),
                                      Text(
                                        "Policy",
                                        //textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => BookScreen()));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllBooksCategoriesScreen(
                                               
                                              )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(
                                          "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.4),
                                          // height: 100,
                                        ),
                                      ),
                                      Text(
                                        "Fiction",
                                        //textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          height: 130,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //! Daily Bonus Read
                Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
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
                                "Daily Bonus Read",
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
                                      borderRadius: BorderRadius.circular(10)),
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
                                                  "Assets/Images/book.png",
                                                  color: darkgrey3,
                                                  height: 25,

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
                                                    fontWeight: FontWeight.bold,
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
                                        padding: const EdgeInsets.only(left: 5),
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
                                                    "Assets/Images/book.png",
                                                    color: darkgrey3,
                                                    height: 25,

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
          )),
        ),
      ),
    );
  }
}
