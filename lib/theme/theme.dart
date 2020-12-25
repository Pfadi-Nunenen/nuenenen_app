import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData mainTheme = ThemeData(
  backgroundColor: lightBackgroundColor,
  cardColor: lightCardColor,
  dividerColor: lightDividerColor,
  accentColor: mainColor,
  primaryColor: mainColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: titleColor,
    displayColor: lightTextColor,
  ),
);

ThemeData darkTheme = ThemeData(
  backgroundColor: darkBackgroundColor,
  cardColor: darkCardColor,
  dividerColor: darkDividerColor,
  accentColor: mainColor,
  primaryColor: mainColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: titleColor,
    displayColor: darkTextColor,
  ),
);