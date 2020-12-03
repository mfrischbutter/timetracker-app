import 'package:flutter/material.dart';

class AppTheme {
  static MaterialColor mogicLightBlue = MaterialColor(0xff3f7fff, {
    50: Color.fromRGBO(63, 126, 255, .1),
    100: Color.fromRGBO(63, 126, 255, .2),
    200: Color.fromRGBO(63, 126, 255, .3),
    300: Color.fromRGBO(63, 126, 255, .4),
    400: Color.fromRGBO(63, 126, 255, .5),
    500: Color.fromRGBO(63, 126, 255, .6),
    600: Color.fromRGBO(63, 126, 255, .7),
    700: Color.fromRGBO(63, 126, 255, .8),
    800: Color.fromRGBO(63, 126, 255, .9),
    900: Color.fromRGBO(63, 126, 255, 1),
  });

  static MaterialColor mogicDarkBlue = MaterialColor(0xff22479b, {
    50: Color.fromRGBO(34, 71, 155, .1),
    100: Color.fromRGBO(34, 71, 155, .2),
    200: Color.fromRGBO(34, 71, 155, .3),
    300: Color.fromRGBO(34, 71, 155, .4),
    400: Color.fromRGBO(34, 71, 155, .5),
    500: Color.fromRGBO(34, 71, 155, .6),
    600: Color.fromRGBO(34, 71, 155, .7),
    700: Color.fromRGBO(34, 71, 155, .8),
    800: Color.fromRGBO(34, 71, 155, .9),
    900: Color.fromRGBO(34, 71, 155, 1),
  });

  static ThemeData light = ThemeData(
    primarySwatch: mogicLightBlue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18),
      bodyText2: TextStyle(fontSize: 14),
      subtitle1: TextStyle(fontSize: 18),
      subtitle2: TextStyle(fontSize: 14),
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        fontSize: 18,
      ),
    ),
    buttonTheme: ButtonThemeData(height: 60),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide.none,
      ),
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      labelStyle: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
