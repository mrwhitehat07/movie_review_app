import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';

enum AppTheme {
  primaryLight,
  primaryDark,
}

final appThemeData = {
  AppTheme.primaryLight: ThemeData(
    primaryColor: Colors.white,
    primaryColorLight: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColors.primaryButtonColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 1,
      selectedIconTheme: IconThemeData(
        color: MyColors.primaryButtonColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
  ),
  AppTheme.primaryDark: ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.black,
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColors.primaryButtonColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 1,
      selectedIconTheme: IconThemeData(
        color: MyColors.primaryButtonColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
  ),
};
