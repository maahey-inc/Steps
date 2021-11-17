import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steps_app/Screens/HomePage.dart';
import 'package:steps_app/Screens/More.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'ChangePhoneNumberScreen.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _controller = new TextEditingController();
  bool isUsernameExists;

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
          if (_controller.value.text.toString() == result.data()['UserName']) {
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
    if (_controller.value.text.toString().isNotEmpty) {
      if (isUsernameExists == false) {
        await FirebaseFirestore.instance
            .collection("UsersData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .update({
          "UserName": "${_controller.value.text}",
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
              "Edit Profile",
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
                  "UsernName",
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
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'UserName',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: darkgrey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                //! Horizontal Line after Username
                // SizedBox(
                //   height: 33,
                // ),
                // Container(
                //   height: 0.5,
                //   color: Colors.grey,
                //   margin: EdgeInsets.symmetric(horizontal: 3),
                // ),
                // SizedBox(
                //   height: 33,
                // ),
                // Container(
                //   // decoration: BoxDecoration(
                //   //     color: darkgrey, borderRadius: BorderRadius.circular(8)),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => ChangePhoneNumberScreen()));
                //     },
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.phone_android,
                //           size: 33,
                //           color: Colors.white,
                //         ),
                //         SizedBox(
                //           width: 20,
                //         ),
                //         Text(
                //           "Change Phone Number",
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 33,
                // ),
                // Container(
                //   height: 0.5,
                //   color: Colors.grey,
                //   margin: EdgeInsets.symmetric(horizontal: 3),
                // ),
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
                        "Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      // fetchDataFromFirebase();
                      updateUser();
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
