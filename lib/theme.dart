import 'package:flutter/material.dart' hide Theme;

abstract class ThemeColors {
  static const primary = Color(0xFF232323);
  static const scaffoldBackground = Color(0xFFF7F7F7);
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
    );
  }
}
