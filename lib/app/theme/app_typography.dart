import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 웹 최적화 타이포그래피 시스템
class AppTypography {
  // === Display (Hero 섹션용) ===
  static const TextStyle display = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    height: 1.1,
    letterSpacing: -1.5,
    color: AppColors.textPrimary,
  );

  // === Headings ===
  static const TextStyle h1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -1.0,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // === Body Text ===
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.6,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.textSecondary,
  );

  // === Labels & Captions ===
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.14,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.textTertiary,
  );

  // === Button Text ===
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.14,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );
}

