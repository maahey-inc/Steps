import 'package:flutter/material.dart';
import 'package:steps_app/Screens/AllCards.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';

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
                  Text(
                    "All Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: darkgrey4,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllCards()));
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
                              color: Colors.black.withOpacity(0.4),
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
                                color: Colors.black.withOpacity(0.4),
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
                                color: Colors.black.withOpacity(0.4),
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
