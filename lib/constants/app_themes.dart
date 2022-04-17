import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  /// Fonts
  static const String fontFamily = 'Montserrat';

  /// Colors
  static const colorBlack = Colors.black;
  static const colorGrey = Color.fromRGBO(141, 141, 141, 1.0);
  static const colorWhite = Colors.white;
  static const colorDarkBlue = Color.fromRGBO(20, 25, 45, 1.0);

  /// Headline 1
  static TextStyle _headline1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 26,
    fontFamily: fontFamily,
  );

  /// Headline 2
  static TextStyle _headline2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    fontFamily: fontFamily,
  );

  /// Headline 3
  static TextStyle _headline3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    fontFamily: fontFamily,
  );

  /// Headline 4
  static TextStyle _headline4 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: fontFamily,
  );

  /// Headline 5
  static TextStyle _headline5 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    fontFamily: fontFamily,
  );

  /// Headline 6
  static TextStyle _headline6 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    fontFamily: fontFamily,
  );

  /// Body Text 1
  static TextStyle _bodyText1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
    fontFamily: fontFamily,
  );

  /// Body Text 2
  static TextStyle _bodyText2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.5,
    fontFamily: fontFamily,
  );

  /// Subtitle 1
  static TextStyle _subtitle1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: fontFamily,
  );

  /// Subtitle 2
  static TextStyle _subtitle2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: fontFamily,
  );

  /// Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    canvasColor: Colors.white,
    textTheme: TextTheme(
      headline1: _headline1.copyWith(color: Colors.black),
      headline2: _headline2.copyWith(color: Colors.black),
      headline3: _headline3.copyWith(color: Colors.black),
      headline4: _headline4.copyWith(color: Colors.black),
      headline5: _headline5.copyWith(color: Colors.black),
      headline6: _headline6.copyWith(color: Colors.black),
      bodyText1: _bodyText1.copyWith(color: Colors.grey),
      bodyText2: _bodyText2.copyWith(color: Colors.grey),
      subtitle1: _subtitle1.copyWith(color: Colors.black),
      subtitle2: _subtitle2.copyWith(color: Colors.grey),
    ),
  );

  /// Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colors.grey.shade900,
    textTheme: TextTheme(
      headline1: _headline1.copyWith(color: Colors.white),
      headline2: _headline2.copyWith(color: Colors.white),
      headline3: _headline3.copyWith(color: Colors.white),
      headline4: _headline4.copyWith(color: Colors.white),
      headline5: _headline5.copyWith(color: Colors.white),
      headline6: _headline6.copyWith(color: Colors.white),
      bodyText1: _bodyText1.copyWith(color: Colors.grey),
      bodyText2: _bodyText2.copyWith(color: Colors.grey),
      subtitle1: _subtitle1.copyWith(color: Colors.white),
      subtitle2: _subtitle2.copyWith(color: Colors.grey),
    ),
  );
}
