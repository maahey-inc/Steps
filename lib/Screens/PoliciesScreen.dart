import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steps_app/Screens/HomePage.dart';
import 'package:steps_app/Screens/More.dart';
import 'package:steps_app/Services/Auth_Services.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliciesScreen extends StatefulWidget {
  PoliciesScreen({Key key}) : super(key: key);

  @override
  _PoliciesScreenState createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  // ignore: missing_return
  // fetchDataFromFirebase() async {
  //   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //   await _fireStore.collection("UsersData").get().then(
  //     (querySnapshot) {
  //       for (var result in querySnapshot.docs) {
  //         if (_controller.value.text.toString() == result.data()['UserName']) {
  //           isUsernameExists = true;
  //         } else {
  //           isUsernameExists = false;
  //         }
  //       }
  //       setState(() {});
  //     },
  //   );
  // }
  void _launchURL() async => await canLaunch(
          "https://policies.google.com/technologies/ads?hl=en-US")
      ? await launch("https://policies.google.com/technologies/ads?hl=en-US")
      : throw 'Could not launch https://policies.google.com/technologies/ads?hl=en-US';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Policies",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! Heading
                Text(
                  "Privacy Policy For Petra Coin",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "At Petra Coin, One Of Our Main Priorities Is The Privacy Of Our Visitors. This Privacy Policy Document Contains Types Of Information That Is Collected And Recorded By Petra Coin And How We Use It.\n\nIf You Have Additional Questions Or Require More Information About Our Privacy Policy, Do Not Hesitate To Contact Us.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Log Files",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "Petra Coin Follows A Standard Procedure Of Using Log Files. These Files Log Visitors When They Use App. The Information Collected By Log Files Include Internet Protocol (IP) Addresses, Browser Type, Internet Service Provider (ISP), Date And Time Stamp, Referring/Exit Pages, And Possibly The Number Of Clicks. These Are Not Linked To Any Information That Is Personally Identifiable. The Purpose Of The Information Is For Analyzing Trends, Administering The App, Tracking Users' Movement On The App, And Gathering Demographic Information.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Our Advertising Partners",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "Some Of Advertisers In Our App May Use Cookies And Web Beacons. Our Advertising Partners Are Listed Below. Each Of Our Advertising Partners Has Their Own Privacy Policy For Their Policies On User Data. For Easier Access, We Hyperlinked To Their Privacy Policies Below.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {
                    // https://policies.google.com/technologies/ads?hl=en-US
                    _launchURL();
                  },
                  child: Text(
                    "- Google",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Privacy Policies",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "You May Consult This List To Find The Privacy Policy For Each Of The Advertising Partners Of Petra Coin.\n\nThird-Party Ad Servers Or Ad Networks Uses Technologies Like Cookies, Javascript, Or Beacons That Are Used In Their Respective Advertisements And Links That Appear On Petra Coin. They Automatically Receive Your IP Address When This Occurs. These Technologies Are Used To Measure The Effectiveness Of Their Advertising Campaigns And/Or To Personalize The Advertising Content That You See On This App Or Other Apps Or Websites.\n\nNote That Petra Coin Has No Access To Or Control Over These Cookies That Are Used By Third-Party Advertisers.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Third Party Privacy Policies",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "Petra Coin's Privacy Policy Does Not Apply To Other Advertisers Or Websites. Thus, We Are Advising You To Consult The Respective Privacy Policies Of These Third-Party Ad Servers For More Detailed Information. It May Include Their Practices And Instructions About How To Opt-Out Of Certain Options.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Children's Information",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "Another Part Of Our Priority Is Adding Protection For Children While Using The Internet. We Encourage Parents And Guardians To Observe, Participate In, And/Or Monitor And Guide Their Online Activity.\n\nPetra Coin Does Not Knowingly Collect Any Personal Identifiable Information From Children Under The Age Of 13. If You Think That Your Child Provided This Kind Of Information On Our App, We Strongly Encourage You To Contact Us Immediately And We Will Do Our Best Efforts To Promptly Remove Such Information From Our Records.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Online Privacy Policy Only",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "This Privacy Policy Applies Only To Our Online Activities And Is Valid For Visitors To Our App With Regards To The Information That They Shared And/Or Collect In Petra Coin. This Policy Is Not Applicable To Any Information Collected Offline Or Via Channels Other Than This App. Our Privacy Policy Was Created With The Help Of The App Privacy Policy Generator From App-Privacy-Policy.Com",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //* --------------------------------------
                //! Heading
                Text(
                  "Consent",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! Description
                Text(
                  "By Using Our App, You Hereby Consent To Our Privacy Policy And Agree To Its Terms And Conditions.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
