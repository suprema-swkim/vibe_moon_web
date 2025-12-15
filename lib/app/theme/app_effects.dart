import 'package:flutter/material.dart';
import 'package:vibe_moon_web/app/theme/app_colors.dart';

class AppEffects {
  // === Blur Values ===
  static const double blurLight = 10.0;
  static const double blurMedium = 20.0;
  static const double blurHeavy = 30.0;

  // === Border Radius ===
  static const double radiusSmall = 12.0;
  static const double radiusMedium = 20.0; // Increased for softer look
  static const double radiusLarge = 32.0;

  // === Glass Effect Presets ===
  static BoxDecoration glassCard({
    Color? color,
    double blur = blurMedium,
    double borderRadius = radiusMedium,
    Border? border,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.glassSurfaceLight, // Lighter surface by default
      borderRadius: BorderRadius.circular(borderRadius),
      border: border ??
          Border.all(
            color: AppColors.borderGlassLight,
            width: 1.0,
          ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowLight, // Softer shadow
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}

