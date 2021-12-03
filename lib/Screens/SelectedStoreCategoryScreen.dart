import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';
import 'SelectedWidgetScreen.dart';

class SelectedStoreCategoryScreen extends StatefulWidget {
  String cover;
  String name;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  SelectedStoreCategoryScreen({
    Key key,
    this.cover,
    this.name,
  }) : super(key: key);

  @override
  _SelectedStoreCategoryScreenState createState() =>
      _SelectedStoreCategoryScreenState();
}

class _SelectedStoreCategoryScreenState
    extends State<SelectedStoreCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: new TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                // indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: EdgeInsets.all(0),
                indicatorPadding: EdgeInsets.all(0),
                // indicator: BoxDecoration(
                //   border: Border(
                //     left: BorderSide(
                //       color: Color(0xff828282),
                //     ), // provides to left side
                //     right: BorderSide(
                //       color: Color(0xff828282),
                //     ), // for right side
                //   ),
                // ),
                tabs: [
                  new Container(
                    height: 33.0,
                    child: Text(
                      "Purchases",
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  new Container(
                    height: 33.0,
                    child: Text(
                      "Disounts",
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.black,
              title: Text(
                "Electrical Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
            body: TabBarView(
              children: [
                Container(
                  color: Colors.black,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "All Electrical Devices",
                                style: TextStyle(
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          //! GridView
                          Expanded(
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 3,
                                      childAspectRatio:
                                          MediaQuery.of(context).size.height /
                                              900,
                                      crossAxisCount:
                                          (MediaQuery.of(context).orientation ==
                                                  Orientation.portrait)
                                              ? 2
                                              : 3),
                              // crossAxisSpacing: 15,
                              // mainAxisSpacing: 15,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: CategoryWidget(
                                    name: "Washing Machine", //Name here,
                                    cover:
                                        "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
                                    isLocalImageAsset: false,
                                    isShowCoins: true,
                                    goldCoins: "150",
                                    silverCoins: "150",
                                    isBookName: false,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedWidgetScreen(
                                          appbarTitle: "Washing Machine",
                                          cover:
                                              "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
                                          name: "Washing Machine",
                                          description:
                                              "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                                          buttonName: "Redeem",
                                          isShowReadingButton: false,
                                          isShowRedeemButton: true,
                                          isShowCoins: true,
                                          isShowAppBarCoins: true,
                                          goldCoins: "150",
                                          silverCoins: "150",
                                          listViewName:
                                              "Other Electrical Devices",
                                          listViewItemCount: 5,
                                          listViewImageCover:
                                              "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
                                          isBookImage: false,
                                          isStoreImage: false,
                                          isDonationImage: true,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "All Electrical Devices",
                                style: TextStyle(
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          //! GridView
                          Expanded(
                            child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 3,
                                      childAspectRatio:
                                          MediaQuery.of(context).size.height /
                                              900,
                                      crossAxisCount:
                                          (MediaQuery.of(context).orientation ==
                                                  Orientation.portrait)
                                              ? 2
                                              : 3),
                              // crossAxisSpacing: 15,
                              // mainAxisSpacing: 15,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: CategoryWidget(
                                    name: "Washing Machine", //Name here,
                                    cover:
                                        "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
                                    isLocalImageAsset: false,
                                    isShowCoins: true,
                                    goldCoins: "150",
                                    silverCoins: "150",
                                    isBookName: false,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedWidgetScreen(
                                          appbarTitle: "Washing Machine",
                                          cover:
                                              "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
                                          name: "Washing Machine",
                                          description:
                                              "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                                          buttonName: "Redeem",
                                          isShowReadingButton: false,
                                          isShowRedeemButton: true,
                                          isShowCoins: true,
                                          isShowAppBarCoins: true,
                                          goldCoins: "150",
                                          silverCoins: "150",
                                          listViewName:
                                              "Other Electrical Devices",
                                          listViewItemCount: 5,
                                          listViewImageCover:
                                              "https://sg.sharp/sites/default/files/uploads/2021-05/Sleek%20design%20of%20SHARP%20washing%20machine.png",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
