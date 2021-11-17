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

class AboutCompanyScreen extends StatefulWidget {
  AboutCompanyScreen({Key key}) : super(key: key);

  @override
  _AboutCompanyScreenState createState() => _AboutCompanyScreenState();
}

class _AboutCompanyScreenState extends State<AboutCompanyScreen> {
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
  void _launchURL(url) async => await canLaunch(url)
      ? await launch(url)
      : throw 'Could not launch ' + url.toString();

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
              "About Company",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Top White Background section
              Container(
                // padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "Assets/Images/Potatologo.png",
                        isAntiAlias: true,
                        filterQuality: FilterQuality.medium,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Potato Media Technology Company",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //! Facebook
                          InkWell(
                            onTap: () {
                              _launchURL("");
                            },
                            child: Image.asset(
                              "Assets/Images/facebook.png",
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //! Twitter
                          InkWell(
                            onTap: () {
                              _launchURL("");
                            },
                            child: Image.asset(
                              "Assets/Images/twitter.png",
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //! Instagram
                          InkWell(
                            onTap: () {
                              _launchURL("");
                            },
                            child: Image.asset(
                              "Assets/Images/instagram.png",
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //! Whatsapp
                          InkWell(
                            onTap: () {
                              _launchURL("");
                            },
                            child: Image.asset(
                              "Assets/Images/whatsapp.png",
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //! Contact Information section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contact Information",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //! www.potato-media.com
                    Container(
                      // decoration: BoxDecoration(
                      //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () {
                          _launchURL("");
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "Assets/Images/discovery.png",
                              width: 22,
                              height: 22,
                              isAntiAlias: true,
                              filterQuality: FilterQuality.medium,
                              // color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "www.potato-media.com",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //! Table
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(0.0),
                      child: Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(
                            children: [
                              //! Location - 1
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                                  child: InkWell(
                                    onTap: () {
                                      _launchURL("");
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "Assets/Images/location.png",
                                          width: 22,
                                          height: 22,
                                          isAntiAlias: true,
                                          filterQuality: FilterQuality.medium,
                                          // color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Jordan - Amman",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //! Location - 2
                              Container(
                                // decoration: BoxDecoration(
                                //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    _launchURL("");
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/location.png",
                                        width: 22,
                                        height: 22,
                                        isAntiAlias: true,
                                        filterQuality: FilterQuality.medium,
                                        // color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Egypt - Cairo",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              //! Phone Number - 1
                              Container(
                                // decoration: BoxDecoration(
                                //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    _launchURL("");
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/call.png",
                                        width: 22,
                                        height: 22,
                                        isAntiAlias: true,
                                        filterQuality: FilterQuality.medium,
                                        // color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "+962564566552",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //! Phone Number - 2
                              Container(
                                // decoration: BoxDecoration(
                                //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    _launchURL("");
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/call.png",
                                        width: 22,
                                        height: 22,
                                        isAntiAlias: true,
                                        filterQuality: FilterQuality.medium,
                                        // color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "+205623451222",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //! About Company Section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About Company",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Potato is a company specialized in developing useful and superior software solutions that keep pass with all developments with quality, accuracy and perfection.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: darkgrey4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Text(
              //   "Lorem ipsum dolor sit amet, ntur sadipscing Elitr, Sed ",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 18,
              //     color: Colors.grey.shade500,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
