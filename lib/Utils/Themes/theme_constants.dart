import 'package:flutter/material.dart';
import 'package:rto/Exports/myExports.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: MyAppColors.primary,
  cardColor: Colors.white,
  scaffoldBackgroundColor: MyAppColors.primaryBackground,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor:
              MaterialStateProperty.all<Color>(MyAppColors.accent))),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: Colors.black,
  
  scaffoldBackgroundColor: Colors.black,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.black),
    thumbColor: MaterialStateProperty.all<Color>(Colors.black),
  ),
);