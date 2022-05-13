
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xffF0190A),
    primaryColorDark: const Color(0xff930B00),
    primaryColorLight: const Color(0xffFF7368),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xffF5F5F5),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xffF0190A),
      elevation: 5.0,
    ),
    fontFamily: 'Futura',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xffFB4C3E),
        fontWeight: FontWeight.bold,
        fontSize: 36.0,
      ),
      headline2: TextStyle(
        color: Color(0xffFB4C3E),
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      bodyText1: TextStyle(
        color: Colors.black45,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      bodyText2: TextStyle(
        color: Color(0xffFB4C3E),
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      ),
    ),
    
  );
}
