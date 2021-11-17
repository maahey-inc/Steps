import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steps_app/Screens/verificationcode.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'HomePage.dart';

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController _controller = new TextEditingController();
  bool isUsernameExists = false;
  bool isUserUidExists = false;
  var imagePlaceholder = 'Assets/Images/shoe.png';
  File imageFile;
  bool isImageFile = false;

  final FirebaseStorage fstorage = FirebaseStorage.instance;
  UploadTask uploadTask;
  String firebaseImageURL;
  //! Firebase Signup
  signupUser() async {
    // print("\n\nSignin Screen" + widget.isSaveData.toString());
    // print("--------------------------------------------");
    // print("isSaveData = " + widget.isSaveData.toString());
    // print("scores = " + widget.scores.toString());
    // print("isTable = " + widget.isTable.toString());
    // print("\n\n");
    //! To prevent null in firebaseImageURL
    String url;
    setState(() {
      url = firebaseImageURL;
    });
    print(url);
    //* If TextField is not empty
    if (_controller.value.text.toString().isNotEmpty) {
      fetchDataFromFirebase();
      if (isUsernameExists == false && isUserUidExists == false) {
        await FirebaseFirestore.instance
            .collection("UsersData")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "UserName": "${_controller.value.text}",
          "Email": "${FirebaseAuth.instance.currentUser.email}",
          "PhoneNumber": "${FirebaseAuth.instance.currentUser.phoneNumber}",
          "Picture": "$url",
          "Uid": "${FirebaseAuth.instance.currentUser.uid}",
          // "user": FirebaseAuth.instance.currentUser.email,
        }).then((value) {
          //* Show success pop up dialog
          print("success");
          //
          //! Navigate to Home Page
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
          //! Show Modal
          showModal();
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

        isUserUidExists
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // duration: const Duration(milliseconds: 1500),
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: const Color(0xFFEE2E50),
                  content: Text(
                    "Your account is already created.",
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

  // ignore: missing_return
  Future<DocumentSnapshot> fetchDataFromFirebase() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    // //* Check if Collection / Table exists or not
    // await _fireStore.collection("UsersData").get().then((querySnapshot) async {
    //   //* Only runs for the first time if table not exists
    //   if (querySnapshot.docs.isEmpty) {
    //     // collection doesnt exist
    //     // then create
    //     FirebaseFirestore.instance
    //         .collection("UsersData")
    //         .doc(FirebaseAuth.instance.currentUser.uid)
    //         .set({
    //       "UserName": "${_controller.value.text}",
    //       "Email": "${FirebaseAuth.instance.currentUser.email}",
    //       "PhoneNumber": "${FirebaseAuth.instance.currentUser.phoneNumber}",
    //       "Picture": "",
    //       "Uid": "${FirebaseAuth.instance.currentUser.uid}",
    //       // "user": FirebaseAuth.instance.currentUser.email,
    //     }).then((value) {});
    //   } else {
    //     //* If table exists, fetch it.
    //     await _fireStore.collection("UsersData").get().then(
    //       (querySnapshot) {
    //         for (var result in querySnapshot.docs) {
    //           if (_controller.value.text.toString() ==
    //               result.data()['UserName']) {
    //             print("\n\n");
    //             print("${result.data()['UserName']}");
    //             print("\n\n");
    //             isUsernameExists = true;
    //           } else {
    //             isUsernameExists = false;
    //           }
    //         }
    //         setState(() {});
    //       },
    //     );
    //   }
    // });

    await _fireStore.collection("UsersData").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (_controller.value.text.toString() == result.data()['UserName']) {
            // print("\n\n");
            // print("${result.data()['UserName']}");
            // print("\n\n");
            isUsernameExists = true;
            // showModal();
          } else if (_controller.value.text.toString() !=
                  result.data()['UserName'] &&
              result.data()['Uid'] == FirebaseAuth.instance.currentUser.uid) {
            isUserUidExists = true;
            //* If username is different but currentUser.uid is matched, means user is already registered
            //* showModal
            showModal();
          } else {
            isUsernameExists = false;
            isUserUidExists = false;
          }
        }
        setState(() {});
      },
    );
  }

  showModal() {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        color: darkgrey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Button(
                      onpressed: () {
                        // fetchData();
                      },
                      color: Color(0xff333333),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          children: [
                            Image.asset(
                              "Assets/Images/fit.png",
                              height: 40,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Google Fit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Text(
                    "∞",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 55,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Button(
                      onpressed: () {},
                      color: Color(0xff333333),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          children: [
                            Image.asset(
                              "Assets/Images/shoe.png",
                              height: 40,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Petra Coin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Welcome To Petra Coin",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: "Arial",
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Start Tracking Your Steps By Linking Our App With Google Fit",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    decoration: TextDecoration.none,
                    fontFamily: "Arial",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                    color: Color(0xff333333),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: Text(
                        "Link",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      Navigator.pop(context);
                      // fetchData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void showImageFile() {
      if (imageFile != null) {
        // if imageFile is not null then replace it with imagePlaceHolder
        isImageFile = true;
      } else {
        isImageFile = false;
      }
    }

    createFirebaseImageURL(File image) async {
      String filePath = "images/${FirebaseAuth.instance.currentUser.uid}";
      setState(() {
        uploadTask = fstorage.ref().child(filePath).putFile(image);
      });
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {
        firebaseImageURL = imageUrl.toString();
      });
    }

    //! Get image from Camera or Gallery
    getImage(bool camera) async {
      XFile pickedFile = await ImagePicker().pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
        // maxWidth: 250,
        // maxHeight: 250,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
        createFirebaseImageURL(imageFile);
        print("IMAGE FILE FROM DEVICE..............................    " +
            imageFile.toString());
      }
      showImageFile();
    }

    getImagePermission() async {
      if (await Permission.storage.status.isDenied ||
          await Permission.photos.status.isDenied) {
        var storageStatus = Platform.isAndroid
            ? await Permission.storage.request()
            : await Permission.photos.request();
        if (storageStatus.isGranted) {
          getImage(false);
        }
      } else {
        getImage(false);
      }
    }

    return Scaffold(
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
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // getImagePermission();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 66,
                    child:
                        //! Image Holder - Top
                        isImageFile
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  imageFile,
                                  fit: BoxFit.cover,
                                  width: 132,
                                  height: 132,
                                ),
                              )
                            :
                            // Image(
                            //     image: imagePlaceholder,
                            //     fit: BoxFit.contain,
                            //     width: 500,
                            //     height: 250,
                            //   ),
                            Icon(
                                Icons.account_circle_outlined,
                                size: 66,
                                color: Colors.black,
                              ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Your Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Insert Your Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkgrey4,
                    fontSize: 16,
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
                    autofocus: false,
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
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      signupUser();
                      // showModal();
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
