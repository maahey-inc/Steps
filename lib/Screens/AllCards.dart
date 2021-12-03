import 'package:flutter/material.dart';
import 'package:steps_app/Screens/CardDetails.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';
import 'CategoryWidget.dart'; 
import 'SelectedWidgetScreen.dart';

class AllCardsScreen extends StatelessWidget {
  //const Storemain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Cards",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //! Top Section
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ytimg.com/vi/HZgf3-o_fiw/maxresdefault.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //! All Cards Text
                Text(
                  "All Cards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: darkgrey4,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                //! GridView
                Container(
                  // height: 300,
                  child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        childAspectRatio:
                            MediaQuery.of(context).size.height / 1100,
                        crossAxisCount: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 2
                            : 3),
                    // crossAxisSpacing: 15,
                    // mainAxisSpacing: 15,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: CategoryWidget(
                          name: "Google Play 10\$ Gift", //Name here,
                          cover: "Assets/Images/GooglePlayGiftCard.png",

                          ///Any Cover Image Link,
                          goldCoins: '10',
                          silverCoins: '10',
                          isLocalImageAsset: true,
                          isShowCoins: true,
                          isBookName: false,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedWidgetScreen(
                                appbarTitle: "Google Play",
                                cover:
                                    "https://gamecardshop.com/pi/Google-Play-10-USD-8597.png",
                                name: "Google Play Cards 10\$",
                                description:
                                    "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                                buttonName: "Redeem",
                                isShowReadingButton: false,
                                isShowRedeemButton: true,
                                  isShowCoins: true,
                            isShowAppBarCoins: true,
                                goldCoins: "10",
                                silverCoins: "10",
                                listViewName: "Other Cards",
                                listViewItemCount: 5,
                                listViewImageCover:
                                    "https://gamecardshop.com/pi/Google-Play-10-USD-8597.png",
                                     isBookImage: false,
                                      isStoreImage: true,
                                isDonationImage: false,
                                       isShowDonationStatistics: false,
                                       isShowDonateButton: false,
                                       isShowDonerBiderList: false,
                                        donerBiderName: "",
                              donerBiderCoins: "",
                              isShowBidsStatistics: false,
                              startBid: "",
                              endBid: "",
                              bidHighestValue: "",
                               isShowBidsButton: false,
                               donerBiderListTitle: "",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // GridView(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   //itemCount: 2,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       mainAxisSpacing: 3,
                //       crossAxisSpacing: 10,
                //       childAspectRatio:
                //           MediaQuery.of(context).size.height / 1300,
                //       crossAxisCount: (MediaQuery.of(context).orientation ==
                //               Orientation.portrait)
                //           ? 2
                //           : 3),
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: [
                //         Expanded(
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(15),
                //             child: Image.network(
                //               "https://www.pakdukaan.com/images/products/388-2-1-593-270521070009.jpg",
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text(
                //           "Amazon 100\$ Gift Card",
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Row(
                //           children: [
                //             Image.asset(
                //               "Assets/Images/g.png",
                //               height: 25,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               "150",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => CardDetails(),
                //           ),
                //         );
                //       },
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.stretch,
                //         children: [
                //           Expanded(
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(15),
                //               child: Image.network(
                //                 "https://www.pakdukaan.com/images/thumbnails-large/capture-7-2-1-16348-270521010148.png",
                //                 fit: BoxFit.fitWidth,
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             height: 10,
                //           ),
                //           Text(
                //             "Google Play 100\$ Gift",
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //             ),
                //           ),
                //           Row(
                //             children: [
                //               Row(
                //                 children: [
                //                   Image.asset(
                //                     "Assets/Images/g.png",
                //                     height: 25,
                //                   ),
                //                   SizedBox(
                //                     width: 5,
                //                   ),
                //                   Text(
                //                     "150",
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: Colors.white,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 5),
                //                 child: Text(
                //                   "+",
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ),
                //               Row(
                //                 children: [
                //                   Image.asset(
                //                     "Assets/Images/s.png",
                //                     height: 25,
                //                   ),
                //                   SizedBox(
                //                     width: 5,
                //                   ),
                //                   Text(
                //                     "150",
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: Colors.white,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                //   // crossAxisSpacing: 15,
                //   // mainAxisSpacing: 15,
                //   // itemBuilder: (context, index) {
                //   //   return
                //   // },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
