import 'dart:async';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:steps_app/Screens/verificationcode.dart';
import 'package:steps_app/Services/Auth_Services.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/Images/shoe.png",
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Petra Coin",
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
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 66,
                  child: Icon(
                    Icons.phone_android,
                    size: 66,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Please Insert Your Phone Number.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                                // SnackBar(
                                //   // duration: const Duration(milliseconds: 1500),
                                //   behavior: SnackBarBehavior.fixed,
                                //   backgroundColor: const Color(0xFF24BC2C),
                                //   content: Text(
                                //     "Please wait...",
                                //     textAlign: TextAlign.center,
                                //     style: const TextStyle(
                                //       color: Colors.white,
                                //       decoration: TextDecoration.none,
                                //       fontFamily: 'RobotoRegular',
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // );
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
                  height: 20,
                ),

                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      Text(
                        "Enter 6 digit OTP",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: PinCodeTextField(
                    autofocus: false,
                    controller: otpController,
                    hideCharacter: true,
                    highlight: true,
                    //highlightColor: Colors.blue,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: darkgrey,
                    highlightPinBoxColor: darkgrey,
                    pinBoxColor: Colors.grey.shade900,
                    maxLength: 6,
                    // hasError: hasError,
                    maskCharacter: "*",
                    onTextChanged: (text) {
                      // setState(() {
                      //   hasError = false;
                      // });
                    },
                    onDone: (text) {
                      setState(() {
                        smsCode = text;
                      });
                      // print("DONE $text");
                      // print("DONE CONTROLLER ${controller.text}");
                    },
                    pinBoxWidth: 40,
                    pinBoxHeight: 40,
                    pinBoxRadius: 5,
                    //hasUnderline: true,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    // pinBoxColor: Colors.green[100],
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
                    //                    highlightAnimation: true,
                    highlightAnimationBeginColor: Colors.black,
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Send OTP again in ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //! OTP Seconds
                      TextSpan(
                        text: "00:${start.toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " sec ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      authClass.signInwithPhoneNumber(
                          verificationIdFinal, smsCode, context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => VerificationcodeScreen()));
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
