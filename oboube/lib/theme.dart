import 'package:flutter/material.dart';
import './constants.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "OpenSans",
    textTheme: textTheme(),
    appBarTheme: AppBarTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline6: TextStyle(color: textColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: primaryColor,
    elevation: 4,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: iconColor),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 20),
    ),
  );
}
