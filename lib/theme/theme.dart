import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mainColor),
);
