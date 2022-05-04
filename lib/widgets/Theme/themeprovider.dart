import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode{
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    }
    else{
      return themeMode == ThemeMode.dark;
    }
  }
  void toggleTheme(bool isOn){
    themeMode = isOn? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
      color: Colors.white,
      ),
    ),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    shadowColor: Colors.white.withOpacity(0.4),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.blue, opacity: 0.8),
    appBarTheme: const AppBarTheme(color: Colors.blue),
    shadowColor: Colors.grey.withOpacity(0.2),
  );
}
