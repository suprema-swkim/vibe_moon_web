import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 글래스모피즘 블러 및 효과 상수
class AppEffects {
  // === Blur Values ===
  static const double blurLight = 10.0;
  static const double blurMedium = 20.0;
  static const double blurHeavy = 30.0;
  static const double blurExtraHeavy = 40.0;

  // === Border Radius ===
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusXLarge = 32.0;
  static const double radiusCircle = 9999.0;

  /// 기본 글래스 카드 데코레이션
  static BoxDecoration glassCard({
    Color? color,
    double blur = blurMedium,
    double borderRadius = radiusMedium,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.glassSurface,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: AppColors.borderGlass,
        width: 1.0,
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadowLight,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  /// 호버 상태 글래스 카드 데코레이션
  static BoxDecoration glassCardHover({
    Color? color,
    double blur = blurMedium,
    double borderRadius = radiusMedium,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.glassSurfaceDark,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: AppColors.borderGlassDark,
        width: 1.5,
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadowMedium,
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    );
  }

  /// Primary 그라데이션 글래스 데코레이션
  static BoxDecoration glassPrimary({
    double borderRadius = radiusMedium,
  }) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.primaryGlass,
          AppColors.secondaryGlass,
        ],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: AppColors.borderGlass,
        width: 1.0,
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.primaryGlass,
          blurRadius: 20,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  /// BackdropFilter를 적용한 위젯 래퍼
  static Widget withBackdropBlur({
    required Widget child,
    double blur = blurMedium,
  }) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }

  /// 글래스 효과가 적용된 Container 생성
  static Widget buildGlassContainer({
    required Widget child,
    double blur = blurMedium,
    double borderRadius = radiusMedium,
    Color? color,
    EdgeInsets? padding,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: glassCard(
            color: color,
            blur: blur,
            borderRadius: borderRadius,
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

