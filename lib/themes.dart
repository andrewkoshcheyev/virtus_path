import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    cardColor: Colors.grey[200],
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      displayLarge: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ).titleLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    cardColor: Colors.grey[800],
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      displayLarge: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ).titleLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
