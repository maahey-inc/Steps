import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'constants.dart';
const Color darkgrey = Color(0xff202020);
const Color darkgrey2 = Color(0xff333333);
const Color darkgrey3 = Color(0xff616161);
const Color darkgrey4 = Color(0xff707070);

// class MyThemes {
//   static final darkTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.black,
//     primaryColor: Colors.black,
//     colorScheme: ColorScheme.dark(),
//     iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
//     appBarTheme: darkappBarTheme(),
//     inputDecorationTheme: darkinputDecorationTheme(),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
//   );

//   static final lightTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     primaryColor: Colors.white,
//     colorScheme: ColorScheme.light(),
//     iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
//     appBarTheme: lightappBarTheme(),
//     inputDecorationTheme: lightinputDecorationTheme(),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//         textTheme: GoogleFonts.ubuntuTextTheme(
//       Theme.of(context).textTheme,
//     ),
//     //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
//   );
// }

ThemeData darktheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
    appBarTheme: darkappBarTheme(),
    inputDecorationTheme: darkinputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
  );
}

ThemeData lighttheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
    appBarTheme: lightappBarTheme(),
    inputDecorationTheme: lightinputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.ubuntuTextTheme(
      Theme.of(context).textTheme,
    ),
    //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
  );
}

InputDecorationTheme darkinputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.white),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

InputDecorationTheme lightinputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.black),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

// TextTheme textTheme() {
// return
//   // return TextTheme(
//   //   bodyText1: TextStyle(color: Colors.white),
//   //   bodyText2: TextStyle(color: Colors.white),
//   //   headline3: TextStyle(
//   //     color: Colors.white,
//   //     fontSize: 20,
//   //     fontWeight: FontWeight.w500,
//   //   ),
//   // );
// }

AppBarTheme darkappBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 10,
    shadowColor: Colors.transparent,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
  );
}

AppBarTheme lightappBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 10,
    shadowColor: Colors.transparent,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 22,
      ),
    ),
  );
}
