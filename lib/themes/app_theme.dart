import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const Color textColor1 = Color(0xFFDDDDDD);
  static const Color textColor2 = Color(0xFF222222);
  static const Color textColor3 = Color(0xFF666666);
  static const Color iconColor1 = Colors.amber;
  static const Color iconColor2 = Colors.pink;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(color: textColor1, fontSize: 70),
      headline2: TextStyle(color: textColor1, fontSize: 70),
      headline3: TextStyle(
        color: textColor1,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: textColor1,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(color: textColor1),
      bodyText2: TextStyle(
        color: textColor1,
        letterSpacing: 10.0,
        wordSpacing: 10.0,
      ),
      subtitle1: TextStyle(
        color: textColor3,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: textColor1,
        fontSize: 14,
      ),
      caption: TextStyle(color: textColor3),
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