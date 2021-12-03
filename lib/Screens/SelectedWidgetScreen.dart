import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'AllParticipantsScreen.dart';
import 'BookScreen.dart';
import 'CategoryWidget.dart';

class SelectedWidgetScreen extends StatefulWidget {
  String appbarTitle;
  String cover;
  String name;
  String description;
  String buttonName;
  bool isShowReadingButton = false;
  bool isShowRedeemButton = false;
  bool isShowCoins = false;
  bool isShowAppBarCoins = false;
  String goldCoins;
  String silverCoins;
  String listViewName;
  int listViewItemCount;
  String listViewImageCover;
  bool isBookImage = false;
  bool isShowDonationStatistics = false;
  String doners;
  String raised;
  String goal;
  double donationProgressValue;
  bool isShowDonateButton = false;
  bool isShowDonerBiderList = false;
  String donerBiderListTitle;
  String donerBiderName;
  String donerBiderCoins;
  bool isStoreImage = false;
  bool isDonationImage = false;
  bool isShowBidsStatistics = false;
  String startBid;
  String endBid;
  String bidHighestValue;
  bool isShowBidsButton = false;
  // Function onTapButtonfunction;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  SelectedWidgetScreen({
    Key key,
    this.appbarTitle,
    this.cover,
    this.name,
    this.description,
    this.buttonName,
    this.isShowReadingButton,
    this.isShowRedeemButton,
    this.isShowCoins,
    this.isShowAppBarCoins,
    this.goldCoins,
    this.silverCoins,
    this.listViewName,
    this.listViewItemCount,
    this.listViewImageCover,
    this.isBookImage,
    this.isShowDonationStatistics,
    this.doners,
    this.raised,
    this.goal,
    this.donationProgressValue,
    this.isShowDonateButton,
    this.isShowDonerBiderList,
    this.donerBiderListTitle,
    this.donerBiderName,
    this.donerBiderCoins,
    this.isStoreImage,
    this.isDonationImage,
    this.isShowBidsStatistics,
    this.startBid,
    this.endBid,
    this.bidHighestValue,
    this.isShowBidsButton,
    // this.onTapButtonfunction,
  }) : super(key: key);

  @override
  _SelectedWidgetScreenState createState() => _SelectedWidgetScreenState();
}

class _SelectedWidgetScreenState extends State<SelectedWidgetScreen> {
  int _groupValue = -1;
  int _itemCount = 0;
  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  showModalRedeem() {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 1.35,
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
                    child: Column(
                      children: [
                        Image.asset(
                          "Assets/Images/RedeemClaimCoins.png",
                          height: 133,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Redeem Your Coin",
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
                padding: const EdgeInsets.only(left: 4.0),
                child: Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 2,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: Image.asset(
                        "Assets/Images/CheckRounded.png",
                        height: 19,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                      title: Text(
                        "Provide some text here.",
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 2,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: Image.asset(
                        "Assets/Images/CheckRounded.png",
                        height: 19,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                      title: Text(
                        "Provide some text here.",
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 2,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: Image.asset(
                        "Assets/Images/CrossRounded.png",
                        height: 19,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                      title: Text(
                        "Provide some text here.",
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
                        "Confirm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      // Navigator.pop(context);
                      // fetchData();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit",
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

  showModalDonate() {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 1.2,
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
                    child: Column(
                      children: [
                        Image.asset(
                          "Assets/Images/donateimg.png",
                          height: 133,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Your Donation Helps Lives!",
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
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Radio(
                                activeColor: Colors.grey,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {
                                  print("Radio1 Clicked");
                                }),
                          ),
                          Expanded(
                            child: Text(
                              'With My Name',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                fontFamily: "Roboto",
                              ),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Radio(
                                activeColor: Colors.grey,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {
                                  print("Radio2 Clicked");
                                }),
                          ),
                          Expanded(
                            child: Text(
                              'Anonymous',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                fontFamily: "Roboto",
                              ),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //! Decrement Button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button(
                        color: Color(0xff333333),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        onpressed: () {
                          setState(() {
                            _itemCount -= 1;
                          });
                          // Navigator.pop(context);
                          // fetchData();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePage()));
                        }),
                  ),
                  //! Coins
                  Row(
                    children: <Widget>[
                      Text(
                        "$_itemCount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontFamily: "Roboto",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset("Assets/Images/g.png"),
                    ],
                  ),
                  //! Increment Button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button(
                        color: Color(0xff333333),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        onpressed: () {
                          setState(() {
                            _itemCount += 1;
                          });
                          // Navigator.pop(context);
                          // fetchData();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePage()));
                        }),
                  ),
                ],
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
                        "Donate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      // Navigator.pop(context);
                      // fetchData();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit",
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

  showModalBids() {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 2,
        color: darkgrey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              //       child: Column(
              //         children: [
              //           Image.asset(
              //             "Assets/Images/donateimg.png",
              //             height: 133,
              //             fit: BoxFit.cover,
              //             filterQuality: FilterQuality.high,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Bidding To Winning!",
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //! Decrement Button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button(
                        color: Color(0xff333333),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        onpressed: () {
                          setState(() {
                            _itemCount -= 1;
                          });
                          // Navigator.pop(context);
                          // fetchData();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePage()));
                        }),
                  ),
                  //! Coins
                  Row(
                    children: <Widget>[
                      Text(
                        "$_itemCount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontFamily: "Roboto",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset("Assets/Images/g.png"),
                    ],
                  ),
                  //! Increment Button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button(
                        color: Color(0xff333333),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        onpressed: () {
                          setState(() {
                            _itemCount += 1;
                          });
                          // Navigator.pop(context);
                          // fetchData();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePage()));
                        }),
                  ),
                ],
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
                        "Place Bids",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onpressed: () {
                      // Navigator.pop(context);
                      // fetchData();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit",
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.appbarTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          widget.isShowAppBarCoins
              ? Padding(
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
                )
              : SizedBox.shrink(),
          widget.isShowAppBarCoins
              ? Padding(
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
              : SizedBox.shrink(),
        ],
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
                  //! Book Image Cover
                  widget.isBookImage
                      ? Container(
                          height: 150,
                          // width: 400,
                          alignment: Alignment.center, // This is needed
                          //color: Colors.blue,
                          child: widget.isBookImage
                              //! For Book Image
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      widget.cover ??
                                          "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                                    ),
                                    fit: BoxFit.contain,
                                    width: 150,
                                    // height: 100,
                                    // width: 50,
                                  ),
                                )
                              : SizedBox.shrink(),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                // color: Color(0xff707070),
                                width: 1,
                              )),
                        )
                      : SizedBox.shrink(),
                  //! Store Image Cover
                  widget.isStoreImage
                      ? Container(
                          height: 150,
                          // width: 400,
                          alignment: Alignment.center, // This is needed
                          //color: Colors.blue,
                          child: widget.isStoreImage
                              //! For Store Image
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      widget.cover ??
                                          "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : SizedBox.shrink(),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                // color: Color(0xff707070),
                                width: 1,
                              )),
                        )
                      : SizedBox.shrink(),
                  //! Donation Image Cover
                  widget.isDonationImage
                      ? Container(
                          height: 150,
                          // width: 400,
                          alignment: Alignment.center, // This is needed
                          //color: Colors.blue,
                          child: widget.isDonationImage
                              //! For Store Image
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      widget.cover ??
                                          "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              : SizedBox.shrink(),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                // color: Color(0xff707070),
                                width: 1,
                              )),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 33,
                  ),
                  //! Bids Stastics Area
                  widget.isShowBidsStatistics
                      ? Container(
                          color: Color(0xff202020),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        //! Bid Starts Time
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.startBid ?? "00:00 Am",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Starts",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //! Bid End Tine
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.endBid ?? "00:00 Pm",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Ends",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //! Big Highest Value
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  widget.bidHighestValue ?? "0",
                                                  style: TextStyle(
                                                    color: Color(0xffB7B7B7),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Highest Value",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 13,
                                // ),
                                //! Bids Progress Bar
                                // LinearProgressIndicator(
                                //   value: widget.donationProgressValue ?? 0.5,
                                //   backgroundColor: Color(0xFFB4B4B4),
                                //   valueColor: new AlwaysStoppedAnimation<Color>(
                                //     Color(0xff25787B),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  //! Donation Statistics Area
                  //! Doner Raised Goal
                  widget.isShowDonationStatistics
                      ? Container(
                          color: Color(0xff202020),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        //! Doner
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.doners ?? "0",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Doner",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //! Raised
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  widget.raised ?? "0",
                                                  style: TextStyle(
                                                    color: Color(0xffB7B7B7),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Raised",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //! Goal
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  widget.goal ?? "0",
                                                  style: TextStyle(
                                                    color: Color(0xffB7B7B7),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  "Assets/Images/g.png",
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Goal",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                //! Donations Progress Bar
                                LinearProgressIndicator(
                                  value: widget.donationProgressValue ?? 0.5,
                                  backgroundColor: Color(0xFFB4B4B4),
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Color(0xff25787B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  //! Reading Button
                  widget.isShowReadingButton
                      ? Button(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: Text(
                                widget.buttonName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )),
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookScreen()));

                            // authClass.signInwithPhoneNumber(
                            //     verificationIdFinal, smsCode, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => VerificationcodeScreen()));
                          },
                        )
                      : SizedBox.shrink(),
                  //! Redeem Button
                  widget.isShowRedeemButton
                      ? Button(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: Text(
                                widget.buttonName ?? "Button",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )),
                          onpressed: () {
                            showModalRedeem();
                            // authClass.signInwithPhoneNumber(
                            //     verificationIdFinal, smsCode, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => VerificationcodeScreen()));
                          },
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 33,
                  ),
                  //! Name
                  Text(
                    widget.name ?? "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  //! Coins
                  widget.isShowCoins
                      ? Row(
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
                                  widget.goldCoins,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                                  widget.silverCoins,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  widget.isShowCoins
                      ? SizedBox(
                          height: 23,
                        )
                      : SizedBox.shrink(),
                  //! Description
                  Text(
                    widget.description ?? "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffAAAAAA),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  //! Doners / Bids List
                  widget.isShowDonerBiderList || widget.isShowBidsStatistics
                      ? Container(
                          color: Color(0xff202020),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      widget.donerBiderListTitle ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
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
                                  itemCount: widget.listViewItemCount,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 33,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                widget.donerBiderName ?? "Name",
                                                style: TextStyle(
                                                  color: darkgrey4,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    widget.donerBiderCoins ??
                                                        "0",
                                                    style: TextStyle(
                                                      color: darkgrey4,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Image.asset(
                                                    "Assets/Images/g.png",
                                                    width: 13,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Button(
                                  color: Colors.black,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                      ),
                                      child: Text(
                                        "See All",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      )),
                                  onpressed: () {
                                    widget.isShowDonateButton
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllParticipantsScreen(
                                                      appbarTitle: "All Doners",
                                                      totalParticipants:
                                                          "Doners (10)",
                                                      isShowParticipantsList:
                                                          true,
                                                      listViewItemCount: 10,
                                                      participantName:
                                                          "Ahmed Abu Adham",
                                                      participantCoins: "1",
                                                    )))
                                        : print("");
                                    widget.isShowBidsButton
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllParticipantsScreen(
                                                      appbarTitle:
                                                          "All Participants",
                                                      totalParticipants:
                                                          "Participants (10)",
                                                      isShowParticipantsList:
                                                          true,
                                                      listViewItemCount: 10,
                                                      participantName:
                                                          "Ahmed Abu Adham",
                                                      participantCoins: "1",
                                                    )))
                                        : print("");
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  widget.isShowDonerBiderList
                      ? SizedBox(
                          height: 33,
                        )
                      : SizedBox.shrink(),
                  //! ListView Name - Other Name
                  widget.isShowDonationStatistics
                      ? SizedBox(
                          height: 13,
                        )
                      : Text(
                          widget.listViewName ?? "Others",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkgrey4,
                            fontSize: 18,
                          ),
                        ),
                  //! ListView Builder - Other
                  widget.isShowDonationStatistics || widget.isShowBidsStatistics
                      ? SizedBox.shrink()
                      : Container(
                          height: 200,
                          child: ListView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 8, 8),
                                        child: Container(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: widget.listViewImageCover !=
                                                    null
                                                ? Image.network(
                                                    widget.listViewImageCover,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.network(
                                                    "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                                    fit: BoxFit.cover,
                                                    // width: 300,
                                                  ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        color: Colors.black.withOpacity(0.4),
                                        // height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 133,
                                          ),
                                          // Text(
                                          //   "Policy",
                                          //   //textAlign: TextAlign.start,
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //     fontSize: 18,
                                          //   ),
                                          // ),
                                          // Text(
                                          //   "lorem ipsum blah blah",
                                          //   overflow: TextOverflow.ellipsis,
                                          //   //textAlign: TextAlign.start,
                                          //   style: TextStyle(
                                          //     //fontWeight: FontWeight.bold,
                                          //     fontSize: 18,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                  //! Donate Button
                  widget.isShowDonateButton
                      ? Button(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: Text(
                                widget.buttonName ?? "Button",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )),
                          onpressed: () {
                            showModalDonate();
                            // authClass.signInwithPhoneNumber(
                            //     verificationIdFinal, smsCode, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => VerificationcodeScreen()));
                          },
                        )
                      : SizedBox.shrink(),
                  //! Donate Button
                  widget.isShowBidsButton
                      ? Button(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: Text(
                                widget.buttonName ?? "Button",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )),
                          onpressed: () {
                            showModalBids();
                            // authClass.signInwithPhoneNumber(
                            //     verificationIdFinal, smsCode, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => VerificationcodeScreen()));
                          },
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 13,
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
