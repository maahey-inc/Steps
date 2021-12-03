import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';
import 'SelectedWidgetScreen.dart';

class AllBidsScreen extends StatefulWidget {
  String cover;
  String name;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  AllBidsScreen({
    Key key,
    this.cover,
    this.name,
  }) : super(key: key);

  @override
  _AllBidsScreenState createState() => _AllBidsScreenState();
}

class _AllBidsScreenState extends State<AllBidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Bids",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        "Active Bids",
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //! ListView
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedWidgetScreen(
                            appbarTitle: "Place Bid",
                            cover:
                                "https://static.toiimg.com/thumb/resizemode-4,width-400,msid-77783789/77783789.jpg",
                            name: "LG Air Conditioner 2 Ton.",
                            description:
                                "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                            buttonName: "Place Bids",
                            isShowReadingButton: false,
                            isShowRedeemButton: false,
                            isShowCoins: false,
                            isShowAppBarCoins: true,
                            goldCoins: "15",
                            silverCoins: "",
                            listViewName: "",
                            listViewItemCount: 3,
                            listViewImageCover:
                                "https://static.toiimg.com/thumb/resizemode-4,width-400,msid-77783789/77783789.jpg",
                            isBookImage: false,
                            isStoreImage: false,
                            isDonationImage: true,
                            isShowDonationStatistics: false,
                            isShowDonateButton: false,
                            isShowDonerBiderList: true,
                            donerBiderName: "Ahmed Abu Adham",
                            donerBiderCoins: "1",
                            isShowBidsStatistics: true,
                            startBid: "08:00 Am",
                            endBid: "12:00 Pm",
                            bidHighestValue: "15",
                            isShowBidsButton: true,
                            donerBiderListTitle: "Participants",
                          ),
                        ),
                      );
                    },
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // child: Image.network(
                                          //   "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                          //   fit: BoxFit.cover,
                                          //   // width: 300,
                                          // ),
                                          child: Image.asset(
                                            "Assets/Images/StartBidding.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Color(0xff707070),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.black.withOpacity(0.0),
                                      // height: 100,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.timer_outlined,
                                                size: 22,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "End: 10 Pm",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
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
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 133,
                                  ),
                                  Text(
                                    "LG Air Conditioner 2 Ton.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 33,
                            ),
                          ],
                        );
                      },
                    ),
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
