import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFF11140D), // reemplazo de background
      onSurface: Colors.white,    // reemplazo de onBackground
      primary: Color(0xFF2E7D32), // verde oliva
      secondary: Color(0xFFFFD700), // dorado
    ),
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFF11140D),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1B1B1B),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2E7D32),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white, fontSize: 32),
      bodyLarge: TextStyle(color: Colors.white70),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
    ),
  );
}
