import 'package:auth_buttons/auth_buttons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:steps_app/Screens/usernamescreen.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class VerificationcodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              "Run and Read",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Image.asset(
                    "Assets/Images/message.png",
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, ntur sadipscing Elitr, Sed ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: PinCodeTextField(
                  autofocus: true,
                  //controller: controller,
                  hideCharacter: true,
                  highlight: true,
                  //highlightColor: Colors.blue,
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: darkgrey,
                  highlightPinBoxColor: darkgrey,
                  maxLength: 4,
                  // hasError: hasError,
                  maskCharacter: "*",
                  onTextChanged: (text) {
                    // setState(() {
                    //   hasError = false;
                    // });
                  },
                  onDone: (text) {
                    // print("DONE $text");
                    // print("DONE CONTROLLER ${controller.text}");
                  },
                  pinBoxWidth: 60,
                  pinBoxHeight: 64,
                  pinBoxRadius: 5,
                  //hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 22.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  // pinBoxColor: Colors.green[100],
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                  //                    highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.black,
                  highlightAnimationEndColor: Colors.white12,
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(
                height: 25,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsernameScreen()));
                  })
              // Container(
              //     height: 60,
              //     color: darkgrey,
              //     child: ),
            ],
          ),
        ),
      ),
    );
  }
}
