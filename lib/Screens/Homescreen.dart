import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steps_app/Screens/AllDonationsScreen.dart';
import 'package:steps_app/Screens/AllParticipantsScreen.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import '../theme.dart';
import 'AllBidsScreen.dart';

class Homescreen extends StatefulWidget {
  //const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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

  bool isMon = false;
  bool isTue = false;
  bool isWed = false;
  bool isThu = false;
  bool isFri = false;
  bool isSat = false;
  bool isSun = false;

  var hours = "0";
  var readTime = "0";
  var seconds = "0";
  var steps = "0";

  bool isTextColorMon = false;
  bool isTextColorTue = false;
  bool isTextColorWed = false;
  bool isTextColorThu = false;
  bool isTextColorFri = false;
  bool isTextColorSat = false;
  bool isTextColorSun = false;

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

  // splitReadTimeData() {
  //   //! Splitting String by :
  //   List<String> splittedMondayReadTime = mondayReadTime.split(':');
  //   fetchedSplittedHoursMondayReadTime = int.parse(splittedMondayReadTime[0]);
  //   fetchedSplittedMinutesMondayReadTime = int.parse(splittedMondayReadTime[1]);
  //   fetchedSplittedSecondsMondayReadTime = int.parse(splittedMondayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedTuesdayReadTime = tuesdayReadTime.split(':');
  //   fetchedSplittedHoursTuesdayReadTime = int.parse(splittedTuesdayReadTime[0]);
  //   fetchedSplittedMinutesTuesdayReadTime =
  //       int.parse(splittedTuesdayReadTime[1]);
  //   fetchedSplittedSecondsTuesdayReadTime =
  //       int.parse(splittedTuesdayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedWednessdayReadTime = wednesdayReadTime.split(':');
  //   fetchedSplittedHoursWednesdayReadTime =
  //       int.parse(splittedWednessdayReadTime[0]);
  //   fetchedSplittedMinutesWednesdayReadTime =
  //       int.parse(splittedWednessdayReadTime[1]);
  //   fetchedSplittedSecondsWednesdayReadTime =
  //       int.parse(splittedWednessdayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedThursdayReadTime = thursdayReadTime.split(':');
  //   fetchedSplittedHoursThursdayReadTime =
  //       int.parse(splittedThursdayReadTime[0]);
  //   fetchedSplittedMinutesThursdayReadTime =
  //       int.parse(splittedThursdayReadTime[1]);
  //   fetchedSplittedSecondsThursdayReadTime =
  //       int.parse(splittedThursdayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedFridayReadTime = fridayReadTime.split(':');
  //   fetchedSplittedHoursFridayReadTime = int.parse(splittedFridayReadTime[0]);
  //   fetchedSplittedMinutesFridayReadTime = int.parse(splittedFridayReadTime[1]);
  //   fetchedSplittedSecondsFridayReadTime = int.parse(splittedFridayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedSaturdayReadTime = saturdayReadTime.split(':');
  //   fetchedSplittedHoursSaturdayReadTime =
  //       int.parse(splittedSaturdayReadTime[0]);
  //   fetchedSplittedMinutesSaturdayReadTime =
  //       int.parse(splittedSaturdayReadTime[1]);
  //   fetchedSplittedSecondsSaturdayReadTime =
  //       int.parse(splittedSaturdayReadTime[2]);

  //   //! Splitting String by :
  //   List<String> splittedSundayReadTime = sundayReadTime.split(':');
  //   fetchedSplittedHoursSundayReadTime = int.parse(splittedSundayReadTime[0]);
  //   fetchedSplittedMinutesSundayReadTime = int.parse(splittedSundayReadTime[1]);
  //   fetchedSplittedSecondsSundayReadTime = int.parse(splittedSundayReadTime[2]);

  //   setState(() {});
  // }

  void controlDisplayData() {
    //! Logic to display in minutes: Hours * 60 + Minutes = Total Minutes
    if (isMon == true) {
      if (mondayUid != null) {
        //! Splitting String by :
        List<String> splittedMondayReadTime = mondayReadTime.split(':');
        fetchedSplittedHoursMondayReadTime =
            int.parse(splittedMondayReadTime[0]);
        fetchedSplittedMinutesMondayReadTime =
            int.parse(splittedMondayReadTime[1]);
        fetchedSplittedSecondsMondayReadTime =
            int.parse(splittedMondayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursMondayReadTime * 60 +
              fetchedSplittedMinutesMondayReadTime;
          readTime = totalMinutesDay.toString();
          steps = mondaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isTue == true) {
      if (tuesdayUid != null) {
        //! Splitting String by :
        List<String> splittedTuesdayReadTime = tuesdayReadTime.split(':');
        fetchedSplittedHoursTuesdayReadTime =
            int.parse(splittedTuesdayReadTime[0]);
        fetchedSplittedMinutesTuesdayReadTime =
            int.parse(splittedTuesdayReadTime[1]);
        fetchedSplittedSecondsTuesdayReadTime =
            int.parse(splittedTuesdayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursTuesdayReadTime * 60 +
              fetchedSplittedMinutesTuesdayReadTime;
          readTime = totalMinutesDay.toString();
          steps = tuesdaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isWed == true) {
      if (wednesdayUid != null) {
        //! Splitting String by :
        List<String> splittedWednessdayReadTime = wednesdayReadTime.split(':');
        fetchedSplittedHoursWednesdayReadTime =
            int.parse(splittedWednessdayReadTime[0]);
        fetchedSplittedMinutesWednesdayReadTime =
            int.parse(splittedWednessdayReadTime[1]);
        fetchedSplittedSecondsWednesdayReadTime =
            int.parse(splittedWednessdayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursWednesdayReadTime * 60 +
              fetchedSplittedMinutesWednesdayReadTime;
          readTime = totalMinutesDay.toString();
          steps = wednesdaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isThu == true) {
      if (thursdayUid != null) {
        //! Splitting String by :
        List<String> splittedThursdayReadTime = thursdayReadTime.split(':');
        fetchedSplittedHoursThursdayReadTime =
            int.parse(splittedThursdayReadTime[0]);
        fetchedSplittedMinutesThursdayReadTime =
            int.parse(splittedThursdayReadTime[1]);
        fetchedSplittedSecondsThursdayReadTime =
            int.parse(splittedThursdayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursThursdayReadTime * 60 +
              fetchedSplittedMinutesThursdayReadTime;
          readTime = totalMinutesDay.toString();
          steps = thursdaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isFri == true) {
      if (fridayUid != null) {
        //! Splitting String by :
        List<String> splittedFridayReadTime = fridayReadTime.split(':');
        fetchedSplittedHoursFridayReadTime =
            int.parse(splittedFridayReadTime[0]);
        fetchedSplittedMinutesFridayReadTime =
            int.parse(splittedFridayReadTime[1]);
        fetchedSplittedSecondsFridayReadTime =
            int.parse(splittedFridayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursFridayReadTime * 60 +
              fetchedSplittedMinutesFridayReadTime;
          readTime = totalMinutesDay.toString();
          steps = fridaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isSat == true) {
      if (saturdayUid != null) {
        //! Splitting String by :
        List<String> splittedSaturdayReadTime = saturdayReadTime.split(':');
        fetchedSplittedHoursSaturdayReadTime =
            int.parse(splittedSaturdayReadTime[0]);
        fetchedSplittedMinutesSaturdayReadTime =
            int.parse(splittedSaturdayReadTime[1]);
        fetchedSplittedSecondsSaturdayReadTime =
            int.parse(splittedSaturdayReadTime[2]);

        setState(() {
          int totalMinutesDay = fetchedSplittedHoursSaturdayReadTime * 60 +
              fetchedSplittedMinutesSaturdayReadTime;
          readTime = totalMinutesDay.toString();
          steps = saturdaySteps.toString();
        });
      } else {
        setState(() {});
      }
    } else if (isSun == true) {
      if (sundayUid != null) {
        //! Splitting String by :
        List<String> splittedSundayReadTime = sundayReadTime.split(':');
        fetchedSplittedHoursSundayReadTime =
            int.parse(splittedSundayReadTime[0]);
        fetchedSplittedMinutesSundayReadTime =
            int.parse(splittedSundayReadTime[1]);
        fetchedSplittedSecondsSundayReadTime =
            int.parse(splittedSundayReadTime[2]);
        setState(() {
          int totalMinutesDay = fetchedSplittedHoursSundayReadTime * 60 +
              fetchedSplittedMinutesSundayReadTime;
          readTime = totalMinutesDay.toString();
          steps = sundaySteps.toString();
        });
      } else {
        setState(() {});
      }
    }
  }

  // ignore: missing_return
  Future<DocumentSnapshot> fetchWeekDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("MondayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
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
          saturdaySteps = result.data()['Steps'];
          saturdayReadTime = result.data()['ReadTime'];
          saturdayStartDateDay = result.data()['StartDateDay'];
          saturdayEndDateDay = result.data()['EndDateDay'];
          saturdayStartDateWeek = result.data()['StartDateWeek'];
          saturdayEndDateWeek = result.data()['EndDateWeek'];
          saturdayUid = result.data()['Uid'];

          //! Spliiting Data fetched from Firebase
          //! Splitting String by :
          List<String> splittedSaturdayReadTime = saturdayReadTime.split(':');
          fetchedSplittedHoursSaturdayReadTime =
              int.parse(splittedSaturdayReadTime[0]);
          fetchedSplittedMinutesSaturdayReadTime =
              int.parse(splittedSaturdayReadTime[1]);
          fetchedSplittedSecondsSaturdayReadTime =
              int.parse(splittedSaturdayReadTime[2]);

          int totalMinutesDay = fetchedSplittedHoursSaturdayReadTime * 60 +
              fetchedSplittedMinutesSaturdayReadTime;

          if (mounted) {
            setState(() {
              //! Setting default Sat values
              readTime = totalMinutesDay.toString();
              steps = saturdaySteps.toString();
              isTextColorMon = false;
              isTextColorTue = false;
              isTextColorWed = false;
              isTextColorThu = false;
              isTextColorFri = false;
              isTextColorSat = true;
              isTextColorSun = false;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              //! Setting default week values
              readTime = "0";
              steps = "0";
              isTextColorMon = false;
              isTextColorTue = false;
              isTextColorWed = false;
              isTextColorThu = false;
              isTextColorFri = false;
              isTextColorSat = true;
              isTextColorSun = false;
            });
          }
        }
      }
    });
    await _fireStore.collection("SundayData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        sundaySteps = result.data()['Steps'];
        sundayReadTime = result.data()['ReadTime'];
        sundayStartDateDay = result.data()['StartDateDay'];
        sundayEndDateDay = result.data()['EndDateDay'];
        sundayStartDateWeek = result.data()['StartDateWeek'];
        sundayEndDateWeek = result.data()['EndDateWeek'];
        sundayUid = result.data()['Uid'];
      }
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchWeekDataFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  // Future fetchData() async {
  //   // //! Getting read Data and wait for it to fetch the data from firebase than run other things
  //   await fetchWeekDataFromFirebase();
  //   if (saturdayEndDateWeek = null) {
  //     //! Spliiting Data fetched from Firebase
  //     splitReadTimeData();
  //     int totalMinutesDay = fetchedSplittedHoursSaturdayReadTime * 60 +
  //         fetchedSplittedMinutesSaturdayReadTime;

  //     setState(() {
  //       //! Setting default Sat values
  //       readTime = totalMinutesDay.toString();
  //       steps = saturdaySteps.toString();
  //       isTextColorMon = false;
  //       isTextColorTue = false;
  //       isTextColorWed = false;
  //       isTextColorThu = false;
  //       isTextColorFri = false;
  //       isTextColorSat = true;
  //       isTextColorSun = false;
  //     });

  //     //! Show data
  //     // controlDisplayData();
  //   } else {
  //     setState(() {
  //       //! Setting default week values
  //       readTime = "0";
  //       steps = "0";
  //       isTextColorMon = false;
  //       isTextColorTue = false;
  //       isTextColorWed = false;
  //       isTextColorThu = false;
  //       isTextColorFri = false;
  //       isTextColorSat = true;
  //       isTextColorSun = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Button(
          onpressed: () {},
          color: Colors.transparent,
          child: Image.asset("Assets/Images/cart.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/s.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "500",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/g.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = false;
                          isWed = false;
                          isThu = false;
                          isFri = false;
                          isSat = true;
                          isSun = false;
                          isTextColorMon = false;
                          isTextColorTue = false;
                          isTextColorWed = false;
                          isTextColorThu = false;
                          isTextColorFri = false;
                          isTextColorSat = true;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Sat",
                        style: TextStyle(
                          color: isTextColorSat
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = false;
                          isWed = false;
                          isThu = false;
                          isFri = false;
                          isSat = false;
                          isSun = true;
                          isTextColorMon = false;
                          isTextColorTue = false;
                          isTextColorWed = false;
                          isTextColorThu = false;
                          isTextColorFri = false;
                          isTextColorSat = false;
                          isTextColorSun = true;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Sun",
                        style: TextStyle(
                          color: isTextColorSun
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = true;
                          isTue = false;
                          isWed = false;
                          isThu = false;
                          isFri = false;
                          isSat = false;
                          isSun = false;
                          isTextColorMon = true;
                          isTextColorTue = false;
                          isTextColorWed = false;
                          isTextColorThu = false;
                          isTextColorFri = false;
                          isTextColorSat = false;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Mon",
                        style: TextStyle(
                          color: isTextColorMon
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = true;
                          isWed = false;
                          isThu = false;
                          isFri = false;
                          isSat = false;
                          isSun = false;
                          isTextColorMon = false;
                          isTextColorTue = true;
                          isTextColorWed = false;
                          isTextColorThu = false;
                          isTextColorFri = false;
                          isTextColorSat = false;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Tue",
                        style: TextStyle(
                          color: isTextColorTue
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = false;
                          isWed = true;
                          isThu = false;
                          isFri = false;
                          isSat = false;
                          isSun = false;
                          isTextColorMon = false;
                          isTextColorTue = false;
                          isTextColorWed = true;
                          isTextColorThu = false;
                          isTextColorFri = false;
                          isTextColorSat = false;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Wed",
                        style: TextStyle(
                          color: isTextColorWed
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = false;
                          isWed = false;
                          isThu = true;
                          isFri = false;
                          isSat = false;
                          isSun = false;
                          isTextColorMon = false;
                          isTextColorTue = false;
                          isTextColorWed = false;
                          isTextColorThu = true;
                          isTextColorFri = false;
                          isTextColorSat = false;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Thu",
                        style: TextStyle(
                          color: isTextColorThu
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMon = false;
                          isTue = false;
                          isWed = false;
                          isThu = false;
                          isFri = true;
                          isSat = false;
                          isSun = false;
                          isTextColorMon = false;
                          isTextColorTue = false;
                          isTextColorWed = false;
                          isTextColorThu = false;
                          isTextColorFri = true;
                          isTextColorSat = false;
                          isTextColorSun = false;
                        });
                        controlDisplayData();
                      },
                      child: Text(
                        "Fri",
                        style: TextStyle(
                          color: isTextColorFri
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //! Read and
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "Assets/Images/book.png",
                                      color: Colors.white,
                                      height: 33,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "$readTime m",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 38,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Reading Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border: Border.all(
                                  color: Color(0xff08B2F6), width: 6),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff08B2F6),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Button(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Reports"),
                            ),
                            onpressed: () {},
                            color: darkgrey2,
                            radius: 23,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "Assets/Images/running.png",
                                      color: Colors.white,
                                      height: 33,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      double.parse(steps).round().toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 38,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Steps Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.yellow, width: 6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow,
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Button(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Reports"),
                            ),
                            onpressed: () {},
                            color: darkgrey2,
                            radius: 23,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Invite Friends
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Invite Friends",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "(0/20)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: darkgrey3,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Get 5 coins for inviting friends.",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Button(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  "Get For ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/g.png",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "5 ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          color: darkgrey2,
                          onpressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Read to Gain
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Read to Gain",
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
                        //     color: Colors.grey.shade500,
                        //   ),
                        // ),
                        SizedBox(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                  //fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                    "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                              )
                            ],
                          ),
                          height: 130,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Bonus Walk
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Daily Bonus Walk",
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
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
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
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Bonus Read
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Charitable Donations
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Charitable Donations",
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
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllDonationsScreen()));
                                      },
                                      child: Container(
                                        height: 222,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "Assets/Images/CharitableDonations.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Image.asset(
                                            //   "Assets/Images/cards.png",
                                            //   fit: BoxFit.cover,
                                            // ),
                                            //Text("anajndj"),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                // height: 100,
                                              ),
                                            ),
                                            Text(
                                              "Donate",
                                              //textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Store
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Store",
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
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Bids
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Bids",
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
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    // AllParticipantsScreen(
                                                    //   isShowParticipantsList:
                                                    //       true,
                                                    //   appbarTitle:
                                                    //       "All Participants",
                                                    //   totalParticipants: "10",
                                                    //   listViewItemCount: 5,
                                                    //   participantName: "Ahmed",
                                                    //   participantCoins: "10",
                                                    // )));
                                                    AllBidsScreen()));
                                      },
                                      child: Container(
                                        height: 222,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "Assets/Images/StartBidding.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Image.asset(
                                            //   "Assets/Images/cards.png",
                                            //   fit: BoxFit.cover,
                                            // ),
                                            //Text("anajndj"),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                // height: 100,
                                              ),
                                            ),
                                            Text(
                                              "Start Bidding",
                                              //textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Task
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Daily Tasks",
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
                        //! Facebook Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/facebookIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Facebook",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Telegram Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/telegramIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Telegram",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Whatsapp Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/whatsappIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Whatsapp",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Share To Win
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                                "Share To Win",
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
                        //! Facebook Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/facebookIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Facebook",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Telegram Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/telegramIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Telegram",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Whatsapp Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/whatsappIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Whatsapp",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Referral Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "www.mylink.com/refre",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                    text:
                                                        "www.mylink.com/refre"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    // duration: const Duration(milliseconds: 1500),
                                                    behavior:
                                                        SnackBarBehavior.fixed,
                                                    backgroundColor:
                                                        const Color(0xFF24BC2C),
                                                    content: Text(
                                                      "Copied.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily:
                                                            'RobotoRegular',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "Copy ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
