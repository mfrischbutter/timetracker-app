import 'package:flutter/material.dart';

class Styles {
  static TextStyle defaultStyle = TextStyle(color: Colors.grey[900]);

  static TextStyle h1 = defaultStyle.copyWith(
    fontWeight: FontWeight.w700,
    color: textColor,
    fontSize: 18.0,
    height: 22 / 18,
  );

  static TextStyle p = defaultStyle.copyWith(
    fontSize: 16.0,
  );

  static TextStyle error = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.red,
  );

  static Color backgroundColor = Color(0xff14061b);
  static Color darkBackgroundColor = Color(0xff110517);
  static Color contrastColor = Colors.white;
  static Color primaryColor = Color(0xfff6102f);
  static Color secondaryColor = Color(0xff840823);
  static Color textColor = Colors.white;

  static InputDecoration input = InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.grey[900],
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: Colors.grey[600],
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey[600],
    ),
  );
}
