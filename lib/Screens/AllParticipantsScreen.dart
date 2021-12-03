import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';

class AllParticipantsScreen extends StatefulWidget {
  String appbarTitle;
  String cover;
  String name;
  String totalParticipants;
  bool isShowParticipantsList = false;
  int listViewItemCount;
  String participantName;
  String participantCoins;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  AllParticipantsScreen({
    Key key,
    this.appbarTitle,
    this.cover,
    this.name,
    this.totalParticipants,
    this.isShowParticipantsList,
    this.listViewItemCount,
    this.participantName,
    this.participantCoins,
  }) : super(key: key);

  @override
  _AllParticipantsScreenState createState() => _AllParticipantsScreenState();
}

class _AllParticipantsScreenState extends State<AllParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.appbarTitle ?? "",
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
      body: Container(
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
                      widget.totalParticipants ?? "",
                      style: TextStyle(
                        color: Color(0xffB7B7B7),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //! Doners List
                widget.isShowParticipantsList
                    ? Container(
                        // color: Color(0xff202020),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(left: 5),
                              //     child: Text(
                              //       "Doners",
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 14,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 10),
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
                                              widget.participantName ??
                                                  "Participant Name",
                                              style: TextStyle(
                                                color: Color(0xffB7B7B7),
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
                                                  widget.participantCoins ??
                                                      "0",
                                                  style: TextStyle(
                                                    color: darkgrey4,
                                                    fontWeight: FontWeight.bold,
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
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
