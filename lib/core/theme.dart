import 'package:flutter/material.dart';

import 'constants.dart';

final kLightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(105, 73, 222, 1.0),
  ),
  cardColor: const Color.fromRGBO(90, 57, 219, 0.5),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: Colors.white,
    hoverColor: Colors.white,
    contentPadding: const EdgeInsets.all(kAppWidgetPadding),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kTextFieldDecorationBorderRadius),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
  ),
  focusColor: Colors.white,
  hintColor: Colors.white70,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(105, 73, 222, 1.0),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white24,
  ),
);

final kDarkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
