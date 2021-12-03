import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';
import 'SelectedWidgetScreen.dart';

class SelectedBookCategoryScreen extends StatefulWidget {
  String cover;
  String name;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  SelectedBookCategoryScreen({
    Key key,
    this.cover,
    this.name,
  }) : super(key: key);

  @override
  _SelectedBookCategoryScreenState createState() =>
      _SelectedBookCategoryScreenState();
}

class _SelectedBookCategoryScreenState
    extends State<SelectedBookCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Books",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedWidgetScreen(
                          appbarTitle: "Read To Gain",
                          cover:
                              "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg",
                          name: "Snippets About Life",
                          description:
                              "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                          buttonName: "Start Reading",
                          isShowReadingButton: true,
                          isShowRedeemButton: false,
                          isShowCoins: false,
                          isShowAppBarCoins: false,
                          goldCoins: "",
                          silverCoins: "",
                          listViewName: "Other Books",
                          listViewItemCount: 5,
                          listViewImageCover:
                              "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg",
                          isBookImage: true,
                          isStoreImage: false,
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
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
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
                                    child: Image.network(
                                      "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                      fit: BoxFit.cover,
                                      // width: 300,
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
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 133,
                                  ),
                                  Text(
                                    "Snippets About Life",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
