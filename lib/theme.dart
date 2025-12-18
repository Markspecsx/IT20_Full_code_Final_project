import 'package:flutter/material.dart';

class FootballScannerTheme {
  static const Color primaryRed = Color(0xFF8B1E2D);
  static const Color darkGray = Color(0xFF1A1A1A); // Darker for deep contrast
  static const Color accentGold = Color(0xFFFFD700);
  static const Color secondaryBlack = Colors.black;
  static const Color surfaceDark = Color(0xFF2B2B2B);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryRed,
      scaffoldBackgroundColor: darkGray,
      colorScheme: const ColorScheme.dark(
        primary: primaryRed,
        secondary: accentGold,
        surface: surfaceDark,
        background: darkGray,
        onBackground: Colors.white,
      ),
      fontFamily: 'Montserrat', // Ensuring modern typography
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white), // Headlines
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white), // Body text
        bodyMedium: TextStyle(fontSize: 14, color: Colors.grey), // Subtitles
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
      ),
    );
  }

  static ThemeData get lightTheme {
    // Basic light theme fallback if needed, user preferred Dark Mode generally
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryRed,
      scaffoldBackgroundColor: Colors.grey[50],
      colorScheme: const ColorScheme.light(
        primary: primaryRed,
        secondary: accentGold,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
