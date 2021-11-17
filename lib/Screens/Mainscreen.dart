import 'package:auth_buttons/auth_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:steps_app/Screens/HomePage.dart';
import 'package:steps_app/Screens/Login.dart';
import 'package:steps_app/Screens/usernamescreen.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class MainSceeen extends StatelessWidget {
  bool isUserExists = false;
  // ignore: missing_return

  //! Check if User Exists
  Future<DocumentSnapshot> fetchDataFromFirebase(context) async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    await _fireStore.collection("UsersData").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (FirebaseAuth.instance.currentUser.uid == result.data()['Uid']) {
            print("\n\n");
            print("${result.data()['Uid']}");
            print("\n\n");
            isUserExists = true;
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          } else {
            isUserExists = false;
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsernameScreen(),
              ),
            );
          }
        }
      },
    );
  }

  signInWithGoogle(context) async {
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //       child: Padding(
    //           padding: const EdgeInsets.all(50),
    //           child: SpinKitDoubleBounce(
    //             color: Colors.white,
    //           )),
    //     );
    //   },
    // );
    try {
      print(' step 1--------------------------------------------');
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleAccount = await googleSignIn.signIn();
      // print(
      //     '${googleAccount.authentication}--------------------------------------------');
      if (googleAccount != null) {
        GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;
        print(' step 2--------------------------------------------');
        if (googleAuth.idToken != null && googleAuth.accessToken != null) {
          print(
              '${googleAuth.idToken}--------------------------------------------');
          final authResult = await FirebaseAuth.instance
              .signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          )
              .then((value) {
            fetchDataFromFirebase(context);
            // if (isUserExists == true) {
            //   Navigator.pop(context);
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => HomePage(),
            //     ),
            //   );
            // } else {
            //   Navigator.pop(context);
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => UsernameScreen(),
            //     ),
            //   );
            // }
          });
          print(
              '${authResult.user}-----------------------------------------user here');

          //return _userFromFirebase(authResult.user);
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Missing Google Authentication Token"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
          ));
          throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Authentication Token',
          );
        }
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sign In aborted by user"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ));
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign In aborted by user',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   "Petra Coin",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //     color: Colors.white,
                //   ),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                Image.asset("Assets/Images/person.png"),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // Text(
                //   "",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontSize: 18,
                //     color: Colors.grey.shade500,
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                //! Google Sign-in
                GoogleAuthButton(
                  text: "Sign Up with Google",
                  onPressed: () {
                    signInWithGoogle(context);
                  },
                  darkMode: false,
                  style: AuthButtonStyle(
                    height: 50,
                    //iconType: AuthIconType.outlined,
                    borderRadius: 5,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey.shade600,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_android),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sign Up With Mobile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
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
