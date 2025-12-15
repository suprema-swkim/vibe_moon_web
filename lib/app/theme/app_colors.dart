import 'dart:ui';
import 'package:flutter/material.dart';

/// 글래스모피즘 2.0 기반 색상 팔레트
class AppColors {
  // === Primary Glass Colors (투명도 포함) ===
  static const Color primaryGlass = Color(0x40667EEA); // 25% opacity
  static const Color primaryGlassLight = Color(0x30667EEA); // 19% opacity
  static const Color primaryGlassDark = Color(0x50667EEA); // 31% opacity
  static const Color primarySolid = Color(0xFF667EEA); // 100% opacity (강조용)

  // === Secondary Glass Colors ===
  static const Color secondaryGlass = Color(0x407F5AF0); // 25% opacity
  static const Color secondaryGlassLight = Color(0x307F5AF0); // 19% opacity
  static const Color secondaryGlassDark = Color(0x507F5AF0); // 31% opacity
  static const Color secondarySolid = Color(0xFF7F5AF0); // 100% opacity

  // === Accent Glass Colors ===
  static const Color accentPink = Color(0x40FF6B9D); // 25% opacity
  static const Color accentCyan = Color(0x4000D9FF); // 25% opacity
  static const Color accentGreen = Color(0x4000F5A0); // 25% opacity
  static const Color accentOrange = Color(0x40FF8A00); // 25% opacity

  // === Background Colors (그라데이션 배경용) ===
  static const Color bgDark = Color(0xFF0F0F1E); // 다크 모드 기본 배경
  static const Color bgDarkSecondary = Color(0xFF1A1A2E);
  static const Color bgLight = Color(0xFFF5F7FA); // 라이트 모드 기본 배경
  static const Color bgLightSecondary = Color(0xFFFFFFFF);

  // === Glass Surface Colors (카드, 패널 등) ===
  static const Color glassSurface = Color(0x1AFFFFFF); // 10% white
  static const Color glassSurfaceLight = Color(0x0DFFFFFF); // 5% white
  static const Color glassSurfaceDark = Color(0x26FFFFFF); // 15% white

  // === Border Colors (글래스 테두리) ===
  static const Color borderGlass = Color(0x33FFFFFF); // 20% white
  static const Color borderGlassLight = Color(0x1AFFFFFF); // 10% white
  static const Color borderGlassDark = Color(0x4DFFFFFF); // 30% white

  // === Text Colors ===
  static const Color textPrimary = Color(0xFFFFFFFF); // 다크 모드 기본 텍스트
  static const Color textSecondary = Color(0xB3FFFFFF); // 70% opacity
  static const Color textTertiary = Color(0x80FFFFFF); // 50% opacity
  static const Color textDisabled = Color(0x4DFFFFFF); // 30% opacity

  static const Color textPrimaryLight = Color(0xFF1A1A2E); // 라이트 모드 기본 텍스트
  static const Color textSecondaryLight = Color(0xB31A1A2E); // 70% opacity
  static const Color textTertiaryLight = Color(0x801A1A2E); // 50% opacity

  // === Status Colors (Glass 버전) ===
  static const Color successGlass = Color(0x4000F5A0); // 25% opacity
  static const Color warningGlass = Color(0x40FFB800); // 25% opacity
  static const Color errorGlass = Color(0x40FF4757); // 25% opacity
  static const Color infoGlass = Color(0x4000D9FF); // 25% opacity

  static const Color successSolid = Color(0xFF00F5A0);
  static const Color warningSolid = Color(0xFFFFB800);
  static const Color errorSolid = Color(0xFFFF4757);
  static const Color infoSolid = Color(0xFF00D9FF);

  // === Shadow Colors ===
  static const Color shadowLight = Color(0x1A000000); // 10% black
  static const Color shadowMedium = Color(0x33000000); // 20% black
  static const Color shadowHeavy = Color(0x4D000000); // 30% black

  // === Gradient Presets ===
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF667EEA),
      Color(0xFF7F5AF0),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF6B9D),
      Color(0xFFFFA06B),
    ],
  );

  static const LinearGradient darkBgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0F0F1E),
      Color(0xFF1A1A2E),
      Color(0xFF16213E),
    ],
  );

  static const LinearGradient lightBgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF5F7FA),
      Color(0xFFE8EAF6),
      Color(0xFFF3E5F5),
    ],
  );

  /// 테마에 따른 Glass Surface 색상 반환
  static Color getGlassSurfaceColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? glassSurface : glassSurfaceLight;
  }

  /// 테마에 따른 텍스트 색상 반환
  static Color getTextPrimaryColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? textPrimary : textPrimaryLight;
  }

  /// 테마에 따른 배경 그라데이션 반환
  static LinearGradient getBgGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? darkBgGradient : lightBgGradient;
  }
}

