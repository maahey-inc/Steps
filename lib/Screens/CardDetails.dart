import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';

class CardDetails extends StatelessWidget {
  //const Storemain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Play",
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://www.pakdukaan.com/images/products/388-2-1-593-270521070009.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              // Container(
              //   //height: 200,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //         "https://www.pakdukaan.com/images/thumbnails-large/capture-7-2-1-16348-270521010148.png",
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Amazon Play Card 100\$",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: darkgrey4,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "Assets/Images/g.png",
                        height: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "150",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "Assets/Images/s.png",
                        height: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "150",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkgrey4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Other Cards",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: darkgrey4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Redeem"),
                ),
                onpressed: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => Material(
                      child: Container(
                        height: 600,
                        color: darkgrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                "Assets/Images/redeem.png",
                                height: 200,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Redeem Your Coin!",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10,
                                        right: 10,
                                      ),
                                      child: Image.asset(
                                          "Assets/Images/check.png"),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10,
                                        right: 10,
                                      ),
                                      child: Image.asset(
                                          "Assets/Images/check.png"),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10,
                                        right: 10,
                                      ),
                                      child: Image.asset(
                                          "Assets/Images/cancel.png"),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                      showCupertinoModalBottomSheet(
                                        context: context,
                                        builder: (context) => Material(
                                          child: Container(
                                            height: 450,
                                            color: darkgrey,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Image.asset(
                                                    "Assets/Images/redeems.png",
                                                    height: 200,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      "Congratulations",
                                                      //textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt",
                                                      // textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Button(
                                                        color:
                                                            Color(0xff333333),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 15,
                                                            bottom: 15,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                  "Assets/Images/cart.png"),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                "Add To Cart",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onpressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                color: darkgrey2,
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
                    childAspectRatio: MediaQuery.of(context).size.height / 1300,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? 2
                        : 3),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://www.pakdukaan.com/images/products/388-2-1-593-270521070009.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Amazon 100\$ Gift Card",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Images/g.png",
                            height: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "150",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://www.pakdukaan.com/images/thumbnails-large/capture-7-2-1-16348-270521010148.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Google Play 100\$ Gift",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "Assets/Images/g.png",
                                height: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "150",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "Assets/Images/s.png",
                                height: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "150",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
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
    );
  }
}
