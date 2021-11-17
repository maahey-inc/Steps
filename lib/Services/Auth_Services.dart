import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:steps_app/Screens/HomePage.dart';
import 'package:steps_app/Screens/usernamescreen.dart';
import 'package:steps_app/Screens/verificationcode.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserExists = false;

  //! Check if User Exists
  Future<DocumentSnapshot> fetchDataFromFirebase(context) async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("UsersData").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            // print("\n\n");
            // print("${result.data()['UserName']}");
            // print("\n\n");
            isUserExists = true;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            isUserExists = false;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UsernameScreen()));
          }
        }
      },
    );
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed", false);
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      // showSnackBar(context, "${exception.message.toString()}", true);
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int forceResnedingtoken]) {
      showSnackBar(
          context, "Verification Code sent on the phone number", false);
      setData(verificationID);
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out", true);
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, "${e.message.toString()}", true);
      // showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      fetchDataFromFirebase(context);
    } catch (e) {
      showSnackBar(context, "${e.message.toString()}", true);
      // showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text, bool isError) {
    final snackBar = isError
        ? SnackBar(
            // duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.fixed,
            backgroundColor: const Color(0xFFEE2E50),
            content: Text(
              "$text",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: 'RobotoRegular',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : SnackBar(
            // duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.fixed,
            backgroundColor: const Color(0xFF24BC2C),
            content: Text(
              "$text",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: 'RobotoRegular',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
