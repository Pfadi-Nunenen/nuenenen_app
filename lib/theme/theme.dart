import 'package:flutter/material.dart';
import 'package:nuenenen/theme/colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mainColor),
);
