import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Screens/BookScreen.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';

class Readmainscreen extends StatefulWidget {
  @override
  State<Readmainscreen> createState() => _ReadmainscreenState();
}

class _ReadmainscreenState extends State<Readmainscreen> {
  var hoursDay;
  var hoursWeek;
  var hoursMonth;

  var minutesDay;
  var minutesWeek;
  var minutesMonth;

  var secondsDay;
  var secondsWeek;
  var secondsMonth;

  var hours;
  var minutes;
  var seconds;

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
  var readStartDateDay;
  var readEndDateDay;
  var readStartDateWeek;
  var readEndDateWeek;
  var readStartDateMonth;
  var readEndDateMonth;
  var readTotalTime;

  int fetchedSplittedHoursDay;
  int fetchedSplittedMinutesDay;
  int fetchedSplittedSecondsDay;

  int fetchedSplittedHoursWeek;
  int fetchedSplittedMinutesWeek;
  int fetchedSplittedSecondsWeek;

  int fetchedSplittedHoursMonth;
  int fetchedSplittedMinutesMonth;
  int fetchedSplittedSecondsMonth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${Provider.of<Homeprovider>(context, listen: false).readTimeValue}");
  }

  // ignore: missing_return
  Future<DocumentSnapshot> fetchDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("ReadData").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
          readTimeDay = result.data()['ReadTimeDay'];
          readTimeWeek = result.data()['ReadTimeWeek'];
          readTimeMonth = result.data()['ReadTimeMonth'];
          readStartDateDay = result.data()['ReadStartDateDay'];
          readEndDateDay = result.data()['ReadEndDateDay'];
          readStartDateWeek = result.data()['ReadStartDateWeek'];
          readEndDateWeek = result.data()['ReadEndDateWeek'];
          readStartDateMonth = result.data()['ReadStartDateMonth'];
          readEndDateMonth = result.data()['ReadEndDateMonth'];
          readTotalTime = result.data()['ReadTotalTime'];
        }
        setState(() {});
      }
    });
  }

  splitReadTimeData() {
    //! Splitting currentScores String by :
    List<String> fetchedSplittedReadTimeDay = readTimeDay.split(':');
    fetchedSplittedHoursDay = int.parse(fetchedSplittedReadTimeDay[0]);
    fetchedSplittedMinutesDay = int.parse(fetchedSplittedReadTimeDay[1]);
    fetchedSplittedSecondsDay = int.parse(fetchedSplittedReadTimeDay[1]);

    //! Splitting currentScores String by :
    List<String> fetchedSplittedReadTimeWeek = readTimeWeek.split(':');
    fetchedSplittedHoursWeek = int.parse(fetchedSplittedReadTimeWeek[0]);
    fetchedSplittedMinutesWeek = int.parse(fetchedSplittedReadTimeWeek[1]);
    fetchedSplittedSecondsWeek = int.parse(fetchedSplittedReadTimeWeek[1]);

    //! Splitting currentScores String by :
    List<String> fetchedSplittedReadTimeMonth = readTimeMonth.split(':');
    fetchedSplittedHoursMonth = int.parse(fetchedSplittedReadTimeMonth[0]);
    fetchedSplittedMinutesMonth = int.parse(fetchedSplittedReadTimeMonth[1]);
    fetchedSplittedSecondsMonth = int.parse(fetchedSplittedReadTimeMonth[1]);
  }

  void controlDisplayData() {
    if (isDay == true) {
      setState(() {
        // steps = stepsDay;
        // miles = milesDay;
        // km = stepsToKmDay;
        // moveMinutes = moveMinutesDay;
        daysCountText = " (Today)";
      });
    } else if (isWeek == true) {
      setState(() {
        daysCountText = " (7 Days)";
      });
    } else if (isMonth == true) {
      setState(() {
        daysCountText = " (Month)";
      });
    }
  }

  Future fetchData() async {
    //! Getting Steps Data
    fetchDataFromFirebase();
    //! Spliiting Data fetched from Firebase
    splitReadTimeData();

    setState(() {
      //! Setting default week values
      hours = hoursWeek;
      minutes = minutesWeek;
      seconds = secondsWeek;
      isTextColorDay = false;
      isTextColorWeek = true;
      isTextColorMonth = false;
      daysCountText = " (7 Days)";
    });

    //! Show data 
    controlDisplayData();
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
                          color: Colors.grey.shade600,
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
                          color: Colors.white,
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
                          color: Colors.grey.shade600,
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
                              "3m",
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
                                  "Reading Today",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                // Text(
                                //   "(7 Days)",
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 15,
                                //   ),
                                // ),
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
                              "150 min",
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
                              "1.2 Mi",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
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
                              "12 pg",
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
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                      "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
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
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookScreen()));
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
