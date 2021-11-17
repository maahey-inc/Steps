import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookScreen extends StatefulWidget {
  BookScreen({Key key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  // int readTimer = 0;
  //! getDisplayTime Variables Control
  final _isHours = true;
  final _isMinutes = true;
  final _isSeconds = true;
  final _isMilliSeconds = false;
  var readTimer;
  var value;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  // Future fetchData() async {
  //   //! For Day
  //   // DateTime startDateDay = DateTime.now().subtract(Duration(days: 1));
  //   // DateTime endDateDay = DateTime.now();
  //   DateTime _firstDateOfTheDay =
  //       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //   DateTime _lastDateOfTheDay = DateTime(
  //       DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  //   DateTime startDateDay = _firstDateOfTheDay;
  //   DateTime endDateDay = _lastDateOfTheDay;
  //   print("Today start Date:       " + _firstDateOfTheDay.toString());
  //   print("Today end Date:       " + _lastDateOfTheDay.toString());

  //   //! For Week
  //   DateTime _firstDateOfTheweek =
  //       DateTime.now().subtract(new Duration(days: DateTime.now().weekday - 1));
  //   DateTime _lastDateOfWeek = _firstDateOfTheweek.add(new Duration(days: 6));
  //   DateTime startDateWeek = _firstDateOfTheweek;
  //   DateTime endDateWeek = _lastDateOfWeek;
  //   print("Week start Date:       " + _firstDateOfTheweek.toString());
  //   print("Week end Date:       " + _lastDateOfWeek.toString());

  //   //! For Month
  //   var _firstDateOfMonth =
  //       new DateTime(DateTime.now().year, DateTime.now().month, 1);
  //   var _lastDateOfMonth =
  //       DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
  //   DateTime startDateMonth = _firstDateOfMonth;
  //   DateTime endDateMonth = _lastDateOfMonth;
  //   print("Month start Date:       " + _firstDateOfMonth.toString());
  //   print("Month end Date:       " + _lastDateOfMonth.toString());

  //   hoursDay = "00";
  //   hoursWeek = "00";
  //   hoursMonth = "00";

  //   minutesDay = "00";
  //   minutesWeek = "00";
  //   minutesMonth = "00";

  //   secondsDay = "00";
  //   secondsWeek = "00";
  //   secondsMonth = "00";

  //   //! Getting Steps Data
  //   fetchDataFromFirebase();
  //   //! Spliiting Data fetched from Firebase
  //   splitReadTimeData();

  //   setState(() {
  //     //! Setting default week values
  //     hours = hoursWeek;
  //     minutes = minutesWeek;
  //     seconds = secondsWeek;
  //     isTextColorDay = false;
  //     isTextColorWeek = true;
  //     isTextColorMonth = false;
  //     daysCountText = " (7 Days)";
  //   });

  //   controlDisplayData();
  //   // print("Steps Day: $stepsDay");
  //   // print("Steps Week: $stepsWeek");
  //   // print("Steps Month: $stepsMonth");
  //   // print("Move Minutes Day: $moveMinutesDay");
  //   // print("Move Minutes Week: $moveMinutesWeek");
  //   // print("StMove Minutesps Month: $moveMinutesMonth");
  //   // print("Steps: ${steps + steps / 1.8}");

  //   // update the UI to display the results
  //   // setState(() {
  //   //   _state =
  //   //       _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
  //   // });
  // }

  @override
  void initState() {
    super.initState();
    startStopWatch();
  }

  @override
  void dispose() async {
    super.dispose();
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
    return WillPopScope(
      onWillPop: () {
        //! Use Provider to store readTimer data when pressing back button
        Provider.of<Homeprovider>(context, listen: false).readTime(readTimer);
        //trigger leaving and use own data
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
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
            ),
          ),
        ),
      ),
    );
  }
}
