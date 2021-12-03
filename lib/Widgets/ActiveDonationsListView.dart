import 'package:flutter/material.dart';
import 'package:steps_app/theme.dart';

class ActiveDonationsListView extends StatefulWidget {
  String listViewImageCover;
  bool isLocalImage = false;
  ActiveDonationsListView({
    Key key,
    this.listViewImageCover,
    this.isLocalImage,
  }) : super(key: key);

  @override
  _ActiveDonationsListViewState createState() =>
      _ActiveDonationsListViewState();
}

class _ActiveDonationsListViewState extends State<ActiveDonationsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return SizedBox(
          // height: 160,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  //! Left Side Content
                  Container(
                    //
                    width: 123,
                    height: 150,
                    child: Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: widget.isLocalImage
                                ? Image.asset(
                                    widget.listViewImageCover,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.listViewImageCover != null
                                        ? widget.listViewImageCover
                                        : "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                                    fit: BoxFit.fitWidth,
                                    width: 100,
                                  ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //! Right Side Content
                  Expanded(
                    child: Container(
                      color: Color(0xff202020),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //! Name
                            Text(
                              "Kids Education",
                              style: TextStyle(
                                color: Color(0xffB7B7B7),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            //! Description
                            Text(
                              "Lorem Ipsum Dolor Sit Amet, Sadipscing  Elitr, Sed Diam Nonu...",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            //! Doner Raised Goal
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //! Doner
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "250",
                                          style: TextStyle(
                                            color: Color(0xffB7B7B7),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
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
                                              "15",
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
                                              "2000",
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
                              value: 0.5,
                              backgroundColor: Color(0xFFB4B4B4),
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                Color(0xff25787B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Text("anajndj"),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                  // height: 100,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 100,
              //       ),
              //       // Text(
              //       //   "Policy",
              //       //   //textAlign: TextAlign.start,
              //       //   style: TextStyle(
              //       //     fontWeight: FontWeight.bold,
              //       //     fontSize: 18,
              //       //   ),
              //       // ),
              //       // Text(
              //       //   "lorem ipsum blah blah",
              //       //   overflow: TextOverflow.ellipsis,
              //       //   //textAlign: TextAlign.start,
              //       //   style: TextStyle(
              //       //     //fontWeight: FontWeight.bold,
              //       //     fontSize: 18,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
