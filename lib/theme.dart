import 'package:flutter/material.dart' hide Theme;

abstract class ThemeColors {
  static const primary = Color(0xFF232323);
  static const scaffoldBackground = Color(0xFFF2F2F2);
  static const primaryText = Color(0xFF343434);
  static const secondaryText = Color(0xFF757575);
}

abstract class Theme {
  static ThemeData build() {
    return ThemeData(
      primaryColor: ThemeColors.primary,
      accentColor: Colors.amber,
      scaffoldBackgroundColor: ThemeColors.scaffoldBackground,
      fontFamily: 'Poppins',
      appBarTheme: const AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      textTheme: const TextTheme(
        headline3: TextStyle(
          fontSize: 14,
          color: ThemeColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          color: ThemeColors.secondaryText,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelPadding: EdgeInsets.symmetric(horizontal: 24),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
        ),
      ),
      buttonTheme: const ButtonThemeData(
        height: 56,
        buttonColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );
  }
}
