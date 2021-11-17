import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steps_app/Screens/HomePage.dart';
import 'package:steps_app/Screens/More.dart';
import 'package:steps_app/Services/Auth_Services.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/Widgets/ExpandWidget.dart';
import 'package:steps_app/theme.dart';

class FAQScreen extends StatefulWidget {
  FAQScreen({Key key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
              "FAQ",
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
              children: <Widget>[
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //! Expandable Widget
                Expandable(
                  primaryWidget: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum Dolor Sit Amet, Con.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Container(
                    height: 120,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: darkgrey4,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Color(0xff202020),
                  showArrowIcon: true,
                  animationDuration: Duration(milliseconds: 500),
                  centralizePrimaryWidget: true,
                  isClickable: true,
                  padding: EdgeInsets.all(10.0),
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.blueGrey,
                    size: 25.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
