import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final lightTheme = ThemeData(
    backgroundColor: whiteBgColor,
    scaffoldBackgroundColor: whiteBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteBgColor,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      unselectedItemColor: textColor,
      selectedItemColor: primaryColor,
    ),
    colorScheme: const ColorScheme.light(
      background: whiteBgColor,
      primary: primaryColor,
      brightness: Brightness.light,
    ),
  );
  final darkTheme = ThemeData(
    backgroundColor: darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBgColor,
      actionsIconTheme: IconThemeData(
        color: darkBgColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkBgColor,
      unselectedItemColor: textDarkColor,
      selectedItemColor: primaryColor,
    ),
    colorScheme: const ColorScheme.dark(
      background: darkBgColor,
      brightness: Brightness.dark,
      primary: primaryColor,
    ),
    scaffoldBackgroundColor: darkBgColor,
  );
}
