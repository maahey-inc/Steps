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

class ChangePhoneNumberScreen extends StatefulWidget {
  ChangePhoneNumberScreen({Key key}) : super(key: key);

  @override
  _ChangePhoneNumberScreenState createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  bool isUsernameExists;
  String countryCode = '+962';
  String initialcountry = 'jo';

  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  String phoneNumber = "";

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
          buttonName = "Resend";
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //! Clean up the controller when the widget is disposed.
    phoneController.dispose();
    otpController.dispose();
  }
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

  //! Firebase Update
  updateUser() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("UsersData").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (phoneController.value.text.toString() ==
              result.data()['UserName']) {
            isUsernameExists = true;
          } else {
            isUsernameExists = false;
          }
        }
        setState(() {});
      },
    );
    // print("\n\nSignin Screen" + widget.isSaveData.toString());
    // print("--------------------------------------------");
    // print("isSaveData = " + widget.isSaveData.toString());
    // print("scores = " + widget.scores.toString());
    // print("isTable = " + widget.isTable.toString());
    // print("\n\n");
    //* If TextField is not empty
    if (phoneController.value.text.toString().isNotEmpty) {
      if (isUsernameExists == false) {
        await FirebaseFirestore.instance
            .collection("UsersData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .update({
          "UserName": "${phoneController.value.text}",
          // "PhoneNumber": "${FirebaseAuth.instance.currentUser.phoneNumber}",
        }).then((value) {
          //* Show success pop up dialog
          print("success");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              // duration: const Duration(milliseconds: 1500),
              behavior: SnackBarBehavior.fixed,
              backgroundColor: const Color(0xFF24BC2C),
              content: Text(
                "Username is saved.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'RobotoRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          //! Navigate Pop
          // Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      } else if (isUsernameExists == true) {
        print("The username is already in use by another account");
        isUsernameExists
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // duration: const Duration(milliseconds: 1500),
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: const Color(0xFFEE2E50),
                  content: Text(
                    "The username is already in use by another account.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontFamily: 'RobotoRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink();
      }
    } else {
      print("Textfield should not be empty");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: const Color(0xFFEE2E50),
          content: Text(
            "Textfield should not be empty.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: 'RobotoRegular',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

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
              "Change Phone Number",
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
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "New Number",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
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
                //! Mobile Number TextField Container
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                  height: 50,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            CountryCodePicker(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.zero,
                              initialSelection: "jo", // Jordan
                              showCountryOnly: true,
                              flagWidth: 20,
                              backgroundColor: Colors.black,
                              dialogBackgroundColor: Colors.black,
                              dialogTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                              searchStyle: TextStyle(
                                color: Colors.white,
                              ),
                              searchDecoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Search...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              dialogSize: Size(
                                  MediaQuery.of(context).size.width - 50,
                                  MediaQuery.of(context).size.height - 100),
                              onChanged: (code) {
                                setState(() {
                                  countryCode = code.dialCode;
                                });
                                // selectedcountry = code.name;
                                print(countryCode);
                                print(code.name);
                              },
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      //! Vertical Line after CountryCodePicker
                      VerticalDivider(
                        color: Color(0xff959595),
                        width: 10,
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      //! Mobile No TextField
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'Mobile No.',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      //! Send / Resend Button
                      TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.centerRight,
                        ),
                        onPressed: wait
                            //! Once user clicked on send button, prevent user from clicking send button again and again
                            ? null
                            : () async {
                                setState(() {
                                  start = 30;
                                  wait = true;
                                  // buttonName = "Resend";
                                });
                                print("Phone Number:            $countryCode" +
                                    "${phoneController.text}");
                                await authClass.verifyPhoneNumber(
                                    // "+923485551899", context, setData);
                                    "$countryCode" + "${phoneController.text}",
                                    context,
                                    setData);
                              },
                        child: Text("$buttonName",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  //! TextField Container Style
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                Button(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: Text(
                        "Confirm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      // fetchDataFromFirebase();
                      // updateUser();
                    })
                // Container(
                //     height: 60,
                //     color: darkgrey,
                //     child: ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
