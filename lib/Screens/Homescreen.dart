import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import '../theme.dart';

class Homescreen extends StatelessWidget {
  //const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Button(
          onpressed: () {},
          color: Colors.transparent,
          child: Image.asset("Assets/Images/cart.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/s.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "500",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/g.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sat",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sun",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Mon",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Tue",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Wed",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Thu",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Fri",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //! Read and
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "Assets/Images/book.png",
                                      color: Colors.white,
                                      height: 33,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "3m",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 38,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Reading Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border: Border.all(
                                  color: Color(0xff08B2F6), width: 6),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff08B2F6),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Button(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Reports"),
                            ),
                            onpressed: () {},
                            color: darkgrey2,
                            radius: 23,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "Assets/Images/running.png",
                                      color: Colors.white,
                                      height: 33,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "1500",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 38,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Steps Today",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.yellow, width: 6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow,
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Button(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Reports"),
                            ),
                            onpressed: () {},
                            color: darkgrey2,
                            radius: 23,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Invite Friends
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Invite Friends",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "(0/20)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: darkgrey3,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Get 5 coins for inviting friends.",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Button(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  "Get For ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/g.png",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "5 ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          color: darkgrey2,
                          onpressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Read to Gain
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Read to Gain",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   "Lorem ipsum dolor sit et, ntur sadipscing Elitr, Sed Diam",
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: Colors.grey.shade500,
                        //   ),
                        // ),
                        SizedBox(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                  //fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                    "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                              )
                            ],
                          ),
                          height: 130,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Bonus Walk
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Daily Bonus Walk",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: darkgrey4,
                        //     fontWeight: FontWeight.bold,
                        //     //fontSize: 16,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: darkgrey3,
                                      size: 50,
                                    ),
                                  ),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: darkgrey2,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Icon(
                                                Icons.lock,
                                                color: darkgrey3,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "Assets/Images/running.png",
                                                  color: darkgrey3,
                                                  height: 30,

                                                  //fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                  child: Divider(
                                                    color: darkgrey3,
                                                    thickness: 2,
                                                  ),
                                                ),
                                                Text(
                                                  "1000",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: darkgrey3,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: darkgrey2,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.lock,
                                                  color: darkgrey3,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "Assets/Images/running.png",
                                                    color: darkgrey3,
                                                    height: 30,

                                                    //fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    width: 60,
                                                    child: Divider(
                                                      color: darkgrey3,
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1500",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: darkgrey2,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 130,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Bonus Read
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Daily Bonus Read",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: darkgrey4,
                        //     fontWeight: FontWeight.bold,
                        //     //fontSize: 16,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: darkgrey3,
                                      size: 50,
                                    ),
                                  ),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: darkgrey2,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Icon(
                                                Icons.lock,
                                                color: darkgrey3,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "Assets/Images/book.png",
                                                  color: darkgrey3,
                                                  height: 25,

                                                  //fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                  child: Divider(
                                                    color: darkgrey3,
                                                    thickness: 2,
                                                  ),
                                                ),
                                                Text(
                                                  "1000",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: darkgrey3,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: darkgrey2,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.lock,
                                                  color: darkgrey3,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "Assets/Images/book.png",
                                                    color: darkgrey3,
                                                    height: 25,

                                                    //fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    width: 60,
                                                    child: Divider(
                                                      color: darkgrey3,
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1500",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: darkgrey2,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 130,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Charitable Donations
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Charitable Donations",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => AllCards()));
                                      },
                                      child: Container(
                                        height: 222,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "Assets/Images/CharitableDonations.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Image.asset(
                                            //   "Assets/Images/cards.png",
                                            //   fit: BoxFit.cover,
                                            // ),
                                            //Text("anajndj"),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                // height: 100,
                                              ),
                                            ),
                                            Text(
                                              "Donate",
                                              //textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Store
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Store",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam",
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: darkgrey4,
                        //     fontWeight: FontWeight.bold,
                        //     //fontSize: 16,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: darkgrey3,
                                      size: 50,
                                    ),
                                  ),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: darkgrey2,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: Icon(
                                                Icons.lock,
                                                color: darkgrey3,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "Assets/Images/book.png",
                                                  color: darkgrey3,
                                                  height: 25,

                                                  //fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                  child: Divider(
                                                    color: darkgrey3,
                                                    thickness: 2,
                                                  ),
                                                ),
                                                Text(
                                                  "1000",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: darkgrey3,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: darkgrey2,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.lock,
                                                  color: darkgrey3,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "Assets/Images/book.png",
                                                    color: darkgrey3,
                                                    height: 25,

                                                    //fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    width: 60,
                                                    child: Divider(
                                                      color: darkgrey3,
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1500",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: darkgrey2,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 130,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Bids
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Bids",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => AllCards()));
                                      },
                                      child: Container(
                                        height: 222,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "Assets/Images/StartBidding.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Image.asset(
                                            //   "Assets/Images/cards.png",
                                            //   fit: BoxFit.cover,
                                            // ),
                                            //Text("anajndj"),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                // height: 100,
                                              ),
                                            ),
                                            Text(
                                              "Start Bidding",
                                              //textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Daily Task
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Daily Tasks",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Facebook Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/facebookIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Facebook",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Telegram Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/telegramIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Telegram",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Whatsapp Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/whatsappIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Whatsapp",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //! Share To Win
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkgrey, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Share To Win",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Facebook Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/facebookIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Facebook",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Telegram Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/telegramIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Telegram",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Whatsapp Daily Task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Images/whatsappIcon.png",
                                            width: 33,
                                            height: 33,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share in Whatsapp",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "5 ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //! Referral Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Button(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "www.mylink.com/refre",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 80,
                                          // ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                    text:
                                                        "www.mylink.com/refre"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    // duration: const Duration(milliseconds: 1500),
                                                    behavior:
                                                        SnackBarBehavior.fixed,
                                                    backgroundColor:
                                                        const Color(0xFF24BC2C),
                                                    content: Text(
                                                      "Copied.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily:
                                                            'RobotoRegular',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "Copy ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkgrey4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              color: darkgrey2,
                              onpressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
