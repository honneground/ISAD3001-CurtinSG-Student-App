import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFFCC9900),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF999999),
    onSecondary: Color(0xFF000000),
    error: Color(0xFFB0003A),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFE8E8E8),
    onSurface: Color(0xFF000000),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xFFCC9900),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF999999),
    onSecondary: Color(0xFF000000),
    error: Color(0xFFB0003A),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF303030),
    onSurface: Color(0xFFBDBDBD),
  ),
);