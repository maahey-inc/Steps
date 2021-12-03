import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  String cover;
  String name;
  String goldCoins;
  String silverCoins;
  bool isShowCoins = false;
  bool isLocalImageAsset = false;
  bool isBookName = false;
  CategoryWidget({
    this.cover,
    this.name,
    this.goldCoins,
    this.silverCoins,
    this.isShowCoins,
    this.isLocalImageAsset,
    this.isBookName,
  });
  // Function onpressed;
  // Bookwidget({this.onpressed});
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 160,
            //width: 100,
            //color: Colors.blue,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: widget.isLocalImageAsset
                  ? Image.asset(
                      widget.cover ??
                          "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                      fit: BoxFit.cover,
                    )
                  //height: MediaQuery.of(context).size.height / 1200,
                  //width: 100,
                  : Image(
                      image: NetworkImage(
                        widget.cover ??
                            "https://edit.org/images/cat/book-covers-big-2019101610.jpg",
                      ),
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
          SizedBox(height: 5),
          //! Name
          widget.isBookName
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.name ?? "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.name ?? "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
          //! Coins
          widget.isShowCoins
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Images/g.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.goldCoins ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Images/s.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.silverCoins ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
