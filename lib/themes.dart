import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.black,
    cardColor: Colors.grey[200],
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 16),
      bodyText2: TextStyle(color: Colors.black, fontSize: 14),
      headline1: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.white,
    cardColor: Colors.grey[800],
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white, fontSize: 16),
      bodyText2: TextStyle(color: Colors.white, fontSize: 14),
      headline1: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
