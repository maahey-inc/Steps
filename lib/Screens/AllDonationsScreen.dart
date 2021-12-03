import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/ActiveDonationsListView.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';
import 'SelectedWidgetScreen.dart';

class AllDonationsScreen extends StatefulWidget {
  String cover;
  String name;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  AllDonationsScreen({
    Key key,
    this.cover,
    this.name,
  }) : super(key: key);

  @override
  _AllDonationsScreenState createState() => _AllDonationsScreenState();
}

class _AllDonationsScreenState extends State<AllDonationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All Donations",
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
                        "Active Donations Until 15/02/2021",
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //! Active Donations ListView Widget
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedWidgetScreen(
                            appbarTitle: "Donations",
                            cover:
                                "https://www.savethechildren.org/content/dam/global/images/countries/burundi/burunid-girl-baby-m194852-hero.jpg/_jcr_content/renditions/original.img.jpg",
                            name: "Kids Education",
                            description:
                                "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                            buttonName: "Donate",
                            isShowReadingButton: false,
                            isShowRedeemButton: false,
                            isShowCoins: false,
                            isShowAppBarCoins: true,
                            goldCoins: "150",
                            silverCoins: "150",
                            listViewName: "",
                            listViewItemCount: 3,
                            listViewImageCover:
                                "https://www.savethechildren.org/content/dam/global/images/countries/burundi/burunid-girl-baby-m194852-hero.jpg/_jcr_content/renditions/original.img.jpg",
                            isBookImage: false,
                            isStoreImage: false,
                            isDonationImage: true,
                            isShowDonationStatistics: true,
                            isShowDonateButton: true,
                            isShowDonerBiderList: true,
                            donerBiderName: "Ahmed Abu Adham",
                            donerBiderCoins: "1",
                            isShowBidsStatistics: false,
                            startBid: "",
                            endBid: "",
                            bidHighestValue: "",
                            isShowBidsButton: false,
                            donerBiderListTitle: "Doners",
                          ),
                        ),
                      );
                    },
                    child: ActiveDonationsListView(
                      isLocalImage: true,
                      listViewImageCover: "Assets/Images/ActiveDonation.png",
                    ),
                  ),
                  SizedBox(height: 33),
                  //! Expired Donations ListView Widget
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Expired Donations",
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                                    borderRadius: BorderRadius.circular(5),
                                    // child: Image.network(
                                    //   "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                    //   fit: BoxFit.cover,
                                    //   // width: 300,
                                    // ),
                                    child: Image.asset(
                                      "Assets/Images/ActiveDonation.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xff707070),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Text("anajndj"),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.7),
                                // height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 133,
                                  ),
                                  Text(
                                    "Providing Food For People In Africa",
                                    textAlign: TextAlign.center,
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
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
