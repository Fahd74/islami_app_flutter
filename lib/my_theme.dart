import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color secondaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color goldColor = Color(0xfffacc1d);
  static Color primaryDark = Color(0xff141A2E);
  static Color secondaryDark = Color(0xff141A2E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    secondaryHeaderColor: secondaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: blackColor
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w300,
        color: blackColor,
      ),
      titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    secondaryHeaderColor: secondaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: goldColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: whiteColor
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w300,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: goldColor
      ),
    ),
  );
}