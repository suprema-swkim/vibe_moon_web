import 'package:flutter/material.dart';

class AppColors {
  // === Pastel Colors (New Design Concept) ===
  static const Color pastelPink = Color(0xFFFFD1DC);
  static const Color pastelPurple = Color(0xFFE0BBE4);
  static const Color pastelPeach = Color(0xFFFFDFD3);
  static const Color pastelBlue = Color(0xFFB5EAEA);
  static const Color deepPurple = Color(0xFF2D2B55); // Primary Button Color
  static const Color softWhite = Color(0xFFFDFDFD);

  // === Glass Surface Colors ===
  static const Color glassSurface = Color(0x1AFFFFFF); // 10% white
  static const Color glassSurfaceLight = Color(0x80FFFFFF); // 50% white (Light Mode)
  static const Color glassSurfaceDark = Color(0x26FFFFFF); // 15% white

  // === Border & Shadow Colors ===
  static const Color borderGlassLight = Color(0x66FFFFFF); // 40% white
  static const Color shadowLight = Color(0x1A2D2B55); // Soft deep purple shadow

  // === Text Colors ===
  static const Color textPrimaryLight = Color(0xFF2D3436); // Dark Grey
  static const Color textSecondaryLight = Color(0xB32D3436);
  static const Color textHint = Color(0xFF9E9E9E);

  // === Status Colors ===
  static const Color success = Color(0xFF00B894);
  static const Color error = Color(0xFFFF7675);
  static const Color warning = Color(0xFFFDCB6E);

  // === Gradient Presets ===
  static const LinearGradient pastelBgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF8Cdda), // Soft Pink
      Color(0xFFFdd6bd), // Peach
      Color(0xFFC9D6FF), // Soft Blue/Purple
    ],
    stops: [0.0, 0.5, 1.0],
  );
}

