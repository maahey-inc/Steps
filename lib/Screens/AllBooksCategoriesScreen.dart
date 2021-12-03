import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'CategoryWidget.dart';
import 'SelectedBookCategoryScreen.dart';
import 'SelectedWidgetScreen.dart';

class AllBooksCategoriesScreen extends StatefulWidget {
  String cover;
  String name;
  // Function onpressed;
  // Bookwidget({this.onpressed});
  AllBooksCategoriesScreen({
    Key key,
    this.cover,
    this.name,
  }) : super(key: key);

  @override
  _AllBooksCategoriesScreenState createState() =>
      _AllBooksCategoriesScreenState();
}

class _AllBooksCategoriesScreenState extends State<AllBooksCategoriesScreen> {
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
                      "All Categories",
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
                          name: "Policy", //Name here,
                          cover:
                              // "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                              "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg",
                          isLocalImageAsset: false,
                          isShowCoins: false,
                          isBookName: true,

                          ///Any Cover Image Link,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SelectedBookCategoryScreen(),
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
    );
  }
}
