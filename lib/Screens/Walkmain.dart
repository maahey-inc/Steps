import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/Widgets/bar_chart_widget.dart';

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

    //! For Day
    // DateTime startDateDay = DateTime.now().subtract(Duration(days: 1));
    // DateTime endDateDay = DateTime.now();
    DateTime _firstDateOfTheDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime _lastDateOfTheDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    DateTime startDateDay = _firstDateOfTheDay;
    DateTime endDateDay = _lastDateOfTheDay;
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

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
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
                          // Card(
                          //   elevation: 4,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(32),
                          //   ),
                          //   color: const Color(0xff020227),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 16),
                          //     child: BarChartWidget(),
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
