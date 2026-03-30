import 'package:flutter/material.dart';
class SaveGoTheme {
  static const Color primary = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFF00D4AA);
  static const Color accentBlue = Color(0xFF00B4D8);
  static const Color orange = Color(0xFFFF6B35);
  static const Color red = Color(0xFFFF4757);
  static const Color darkBg = Color(0xFF0D0D0D);
  static const Color lightBg = Color(0xFFF8F9FA);
  static const Color textDark = Color(0xFF2D3436);
  static ThemeData get light => ThemeData(primaryColor: primary, scaffoldBackgroundColor: lightBg, colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.light));
  static ThemeData get dark => ThemeData(primaryColor: primary, scaffoldBackgroundColor: darkBg, colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark));
}
