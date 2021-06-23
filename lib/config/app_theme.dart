import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

MaterialColor mogicLightBlue = MaterialColor(0xff3f7fff, {
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

MaterialColor mogicDarkBlue = MaterialColor(0xff22479b, {
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

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
    elevatedButtonTheme: _buildDefaultButtonTheme(base.elevatedButtonTheme),
    primaryColor: Color(0xff007bff),
    accentColor: Color(0xff0067D5),
    dividerColor: Color(0xffeeeeee),
    // For Login Box, if the user is not logged in, on the news details page.
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
    ),
  );
}

TextTheme _buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
    // Ueberschrift in running activity
    headline1: base.headline1?.copyWith(
      fontSize: 6.2.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    headline2: base.headline2?.copyWith(
      fontSize: 5.sp,
      color: Colors.white,
    ),
    headline3: base.headline3?.copyWith(
      fontSize: 4.5.sp,
      color: Color(0xff535353),
    ),
    headline4: base.headline4?.copyWith(
      fontSize: 4.5.sp,
      color: Color(0xff7d7c7c),
    ),
    headline5: base.headline5?.copyWith(
      fontSize: 4.5.sp,
      color: Color(0xff7d7c7c),
    ),
    subtitle1: base.subtitle1?.copyWith(
      fontSize: 4.5.sp,
      color: Color(0xff7d7c7c),
    ),
    subtitle2: base.subtitle2?.copyWith(
      fontSize: 4.5.sp,
      fontWeight: FontWeight.normal,
    ),
    bodyText1: base.bodyText1?.copyWith(
      fontSize: 4.5.sp,
      color: Color(0xff7d7c7c),
      fontWeight: FontWeight.normal,
    ),
    bodyText2: base.bodyText2?.copyWith(
      fontSize: 3.7.sp,
      color: Color(0xff7d7c7c),
      fontWeight: FontWeight.normal,
    ),
    button: base.button?.copyWith(
      fontSize: 6.sp,
    ),
  );
}

ElevatedButtonThemeData _buildDefaultButtonTheme(ElevatedButtonThemeData base) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return Color(0xff2A91FF);
          else if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Color(0xff007BFF); // Use the component's default.
        },
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(
          vertical: 1.5.h,
          horizontal: 0.w,
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: 6.sp,
        ),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
  );
}
