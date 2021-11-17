import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:steps_app/Screens/Homescreen.dart';
import 'package:steps_app/Screens/More.dart';
import 'package:steps_app/Screens/Readmainscreen.dart';
import 'package:steps_app/Screens/Storemain.dart';
import 'package:steps_app/Screens/Walkmain.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);

  List widgetlist = [
    Walkmainscreen(),
    Readmainscreen(),
    Homescreen(),
    Storemain(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    var providervar = Provider.of<Homeprovider>(context, listen: false);
    var providerfunc = Provider.of<Homeprovider>(context);
    return Scaffold(
      body: widgetlist[providervar.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: providervar.currentindex,
        //showSelectedLabels: false,
        // selectedLabelStyle:
        //     TextStyle(fontSize: providervar.currentindex == 2 ? 0 : 16),
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(providervar.currentindex == 0
                  ? 'Assets/Images/walkf.png'
                  : 'Assets/Images/walk.png'),
              height: 25,
            ),
            label: "Walk",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(providervar.currentindex == 1
                  ? 'Assets/Images/readf.png'
                  : 'Assets/Images/read.png'),
              height: 25,
              //width: 25,
            ),
            label: "Read",
          ),
          BottomNavigationBarItem(
            icon: providervar.currentindex == 2
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        // height: 25,
                        // width: 25,
                        child: Image.asset(
                          "Assets/Images/home.png",
                          color: Colors.white,
                          fit: BoxFit.contain,
                          height: 33,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFFD52E),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Image(
                          image: AssetImage(
                            'Assets/Images/home.png',
                          ),
                          height: 33,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
            label: "",
            //title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(providervar.currentindex == 3
                  ? 'Assets/Images/shopf.png'
                  : 'Assets/Images/shop.png'),
              height: 25,
            ),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(providervar.currentindex == 4
                  ? 'Assets/Images/moref.png'
                  : 'Assets/Images/more.png'),
              height: 25,
            ),
            label: "More",
          ),
        ],
        onTap: (index) {
          providerfunc.changeindex(index);
        },
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Color(0xff616161),
        backgroundColor: Colors.black,
      ),
    );
  }
}
