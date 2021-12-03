import 'package:flutter/material.dart';
import 'package:steps_app/Screens/AllCards.dart';
import 'package:steps_app/Screens/SelectedStoreCategoryScreen.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';
import 'AllBidsScreen.dart';
import 'CategoryWidget.dart';

class Storemain extends StatelessWidget {
  //const Storemain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Store",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Image.asset("Assets/Images/cart.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 2,
            ),
            child: Button(
              child: Row(
                children: [
                  Image.asset(
                    "Assets/Images/s.png",
                    height: 25,
                  ),
                  SizedBox(
                    width: 5,
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
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 2,
            ),
            child: Button(
              child: Row(
                children: [
                  Image.asset(
                    "Assets/Images/g.png",
                    height: 25,
                  ),
                  SizedBox(
                    width: 5,
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //! Country and City
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Country",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkgrey4,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "City",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkgrey4,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  //! All Categories Text
                  Text(
                    "All Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: darkgrey3,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  //! Cards
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCardsScreen()));
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            "Assets/Images/cards.png",
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
                              color: Colors.black.withOpacity(0.6),
                              // height: 100,
                            ),
                          ),
                          Text(
                            "Cards",
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
                  SizedBox(
                    height: 20,
                  ),
                  //! GridView
                  // Container(
                  //   child: GridView.builder(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: 6,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         mainAxisSpacing: 3,
                  //         crossAxisSpacing: 3,
                  //         childAspectRatio:
                  //             MediaQuery.of(context).size.height / 1100,
                  //         crossAxisCount: (MediaQuery.of(context).orientation ==
                  //                 Orientation.portrait)
                  //             ? 2
                  //             : 3),
                  //     // crossAxisSpacing: 15,
                  //     // mainAxisSpacing: 15,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         child: CategoryWidget(
                  //           name: "Policy", //Name here,
                  //           cover:
                  //               "https://edit.org/images/cat/book-covers-big-2019101610.jpg",

                  //           ///Any Cover Image Link,
                  //         ),
                  //         onTap: () {},
                  //       );
                  //     },
                  //   ),
                  // ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio:
                            MediaQuery.of(context).size.height / 1000,
                        crossAxisCount: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 2
                            : 3),
                    children: [
                      Container(
                        // height: 200,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "Assets/Images/electrical.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SelectedStoreCategoryScreen(
                                         
                                        )));
                          },
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
                                  color: Colors.black.withOpacity(0.6),
                                  // height: 100,
                                ),
                              ),
                              Text(
                                "Electrical \nDevices",
                                textAlign: TextAlign.center,
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
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "Assets/Images/gamecards.png",
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
                                color: Colors.black.withOpacity(0.6),
                                // height: 100,
                              ),
                            ),
                            Text(
                              "Game Cards",
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllBidsScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  "Assets/Images/Participation.png",
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
                                    color: Colors.black.withOpacity(0.6),
                                    // height: 100,
                                  ),
                                ),
                                Text(
                                  "Participations",
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                "Assets/Images/gamecards.png",
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
                                  color: Colors.black.withOpacity(0.6),
                                  // height: 100,
                                ),
                              ),
                              Text(
                                "Game Cards",
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
                    ],
                    // crossAxisSpacing: 15,
                    // mainAxisSpacing: 15,
                    // itemBuilder: (context, index) {
                    //   return
                    // },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
