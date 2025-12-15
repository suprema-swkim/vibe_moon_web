import 'package:flutter/material.dart';
import 'package:vibe_moon_web/app/theme/app_colors.dart';
import 'package:vibe_moon_web/app/theme/app_effects.dart';
import 'package:vibe_moon_web/app/theme/app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.deepPurple,
      scaffoldBackgroundColor: Colors.transparent, // 투명하게 설정하여 배경 그라데이션 노출

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.deepPurple,
        brightness: Brightness.light,
        surface: AppColors.glassSurfaceLight,
        error: AppColors.error,
      ),

      // Typography
      textTheme: const TextTheme(
        displayLarge: AppTypography.h1,
        displayMedium: AppTypography.h2,
        displaySmall: AppTypography.h3,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.button,
      ),

      // Input Decoration (Glass Style)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.glassSurfaceLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          borderSide: const BorderSide(color: AppColors.borderGlassLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          borderSide: const BorderSide(color: AppColors.borderGlassLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          borderSide: const BorderSide(color: AppColors.deepPurple, width: 1.5),
        ),
        hintStyle: const TextStyle(color: AppColors.textHint),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          ),
          textStyle: AppTypography.button,
        ),
      ),
    );
  }
}

