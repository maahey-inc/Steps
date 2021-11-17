import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// class MyThemes {
//   static final darkTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.grey.shade900,
//     primaryColor: Colors.black,
//     colorScheme: ColorScheme.dark(),
//     iconTheme: IconThemeData(color: Constants.maincolor, opacity: 0.8),
//     //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
//   );

//   static final lightTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     primaryColor: Colors.white,
//     colorScheme: ColorScheme.light(),
//     iconTheme: IconThemeData(color: Constants.maincolor, opacity: 0.8),
//     //textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
//   );
// }
