import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Provider/theme_provider.dart';
import 'package:steps_app/Screens/AllDonationsScreen.dart';
import 'package:steps_app/Screens/CardDetails.dart';
import 'package:steps_app/Screens/Login.dart';
import 'package:steps_app/Screens/Mainscreen.dart';
import 'package:steps_app/Screens/Storemain.dart';
import 'package:steps_app/Screens/usernamescreen.dart';
import 'package:steps_app/theme.dart';

import 'Screens/AllBidsScreen.dart';
import 'Screens/AllBooksCategoriesScreen.dart';
import 'Screens/AllCards.dart';
import 'Screens/AllParticipantsScreen.dart';
import 'Screens/HomePage.dart';
import 'Screens/SelectedStoreCategoryScreen.dart';
import 'Screens/SelectedWidgetScreen.dart';
import 'Screens/SelectedBookCategoryScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  static BuildContext appContext;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    MyApp.appContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Homeprovider>(
          create: (context) => Homeprovider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Steps App',
        theme: lighttheme(context),
        darkTheme: darktheme(context),
        home: FirebaseAuth.instance.currentUser != null
            ? HomePage()
            : MainSceeen(),
        // home: AllBidsScreen(),
      ),
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:health/health.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// enum AppState {
//   DATA_NOT_FETCHED,
//   FETCHING_DATA,
//   DATA_READY,
//   NO_DATA,
//   AUTH_NOT_GRANTED
// }

// class _MyAppState extends State<MyApp> {
//   List<HealthDataPoint> _healthDataList = [];
//   AppState _state = AppState.DATA_NOT_FETCHED;

//   @override
//   void initState() {
//     super.initState();
//   }

//   /// Fetch data from the health plugin and print it
//   Future fetchData() async {
//     // get everything from midnight until now
//     DateTime startDate = DateTime.now().subtract(Duration(days: 1));
//     DateTime endDate = DateTime.now();

//     HealthFactory health = HealthFactory();

//     // define the types to get
//     List<HealthDataType> types = [
//       HealthDataType.STEPS,
//       HealthDataType.DISTANCE_DELTA,
//       HealthDataType.WEIGHT,
//       //HealthDataType.HEIGHT,
//       //HealthDataType.BLOOD_GLUCOSE,
//       //HealthDataType.DISTANCE_WALKING_RUNNING,
//     ];

//     setState(() => _state = AppState.FETCHING_DATA);

//     print("getting Access");

//     // you MUST request access to the data types before reading them
//     bool accessWasGranted = await health.requestAuthorization(types);
//     print(accessWasGranted);
//     int steps = 0;

//     if (accessWasGranted) {
//       try {
//         // fetch new data
//         List<HealthDataPoint> healthData =
//             await health.getHealthDataFromTypes(startDate, endDate, types);

//         // save all the new data points
//         _healthDataList.addAll(healthData);
//       } catch (e) {
//         print("Caught exception in getHealthDataFromTypes: $e");
//       }

//       // filter out duplicates
//       _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

//       // print the results
//       _healthDataList.forEach((x) {
//         //print(x.typeString == "steps");
//         //print(x.type);
//         //print(x.value.round());
//         steps += x.value.round();
//       });

//       print("Steps: ${steps + steps / 1.8}");

//       // update the UI to display the results
//       setState(() {
//         _state =
//             _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
//       });
//     } else {
//       print("Authorization not granted");
//       setState(() => _state = AppState.DATA_NOT_FETCHED);
//     }
//   }

//   Widget _contentFetchingData() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//             padding: EdgeInsets.all(20),
//             child: CircularProgressIndicator(
//               strokeWidth: 10,
//             )),
//         Text('Fetching data...')
//       ],
//     );
//   }

//   Widget _contentDataReady() {
//     return ListView.builder(
//         itemCount: _healthDataList.length,
//         itemBuilder: (_, index) {
//           HealthDataPoint p = _healthDataList[index];
//           return ListTile(
//             title: Text("${p.typeString}: ${p.value}"),
//             trailing: Text('${p.unitString}'),
//             subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
//           );
//         });
//   }

//   Widget _contentNoData() {
//     return Text('No Data to show');
//   }

//   Widget _contentNotFetched() {
//     return Text('Press the download button to fetch data');
//   }

//   Widget _authorizationNotGranted() {
//     return Text('''Authorization not given.
//         For Android please check your OAUTH2 client ID is correct in Google Developer Console.
//          For iOS check your permissions in Apple Health.''');
//   }

//   Widget _content() {
//     if (_state == AppState.DATA_READY)
//       return _contentDataReady();
//     else if (_state == AppState.NO_DATA)
//       return _contentNoData();
//     else if (_state == AppState.FETCHING_DATA)
//       return _contentFetchingData();
//     else if (_state == AppState.AUTH_NOT_GRANTED)
//       return _authorizationNotGranted();

//     return _contentNotFetched();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Plugin example app'),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.file_download),
//                 onPressed: () {
//                   fetchData();
//                 },
//               )
//             ],
//           ),
//           body: Center(
//             child: _content(),
//           )),
//     );
//   }
// }
