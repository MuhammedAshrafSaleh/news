import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xFFF8A12D);
  static const Color secondaryColor = Color(0xFFF5832D);
  static const Color redColor = Color(0xFFEF3B2A);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}