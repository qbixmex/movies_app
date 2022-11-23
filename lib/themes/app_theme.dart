import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.pink;
  static const Color textColor = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(color: textColor, fontSize: 70),
      headline2: TextStyle(color: textColor, fontSize: 70),
      bodyText2: TextStyle(color: textColor),
      subtitle1: TextStyle(color: textColor, fontSize: 60),
    ),

    scaffoldBackgroundColor: const Color(0xFF222222),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(        
        foregroundColor: primary,        
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary, fontWeight: FontWeight.bold),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      prefixIconColor: AppTheme.primary,
      suffixIconColor: AppTheme.primary,
      iconColor: AppTheme.primary,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
  );
  
}