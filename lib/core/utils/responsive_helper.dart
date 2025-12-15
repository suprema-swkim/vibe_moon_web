import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';

/// 반응형 레이아웃 헬퍼
class ResponsiveHelper {
  /// 모바일 여부 확인 (< 640px)
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < Breakpoints.mobile;
  }

  /// 태블릿 여부 확인 (768px ~ 1024px)
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= Breakpoints.mobile && width < Breakpoints.desktop;
  }

  /// 데스크톱 여부 확인 (1024px ~ 1440px)
  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= Breakpoints.desktop && width < Breakpoints.widescreen;
  }

  /// 와이드스크린 여부 확인 (>= 1440px)
  static bool isWidescreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= Breakpoints.widescreen;
  }

  /// 울트라와이드 여부 확인 (>= 1920px)
  static bool isUltrawide(BuildContext context) {
    return MediaQuery.of(context).size.width >= Breakpoints.ultrawide;
  }

  /// 반응형 값 반환
  static double getResponsiveValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? widescreen,
  }) {
    if (isWidescreen(context)) {
      return widescreen ?? desktop ?? tablet ?? mobile;
    }
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  /// 반응형 패딩 반환
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isWidescreen(context)) {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 40);
    }
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 32);
    }
    if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }

  /// 반응형 그리드 컬럼 수 반환
  static int getGridColumns(BuildContext context) {
    if (isWidescreen(context)) return 4;
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  /// 반응형 최대 너비 반환
  static double getMaxWidth(BuildContext context) {
    if (isWidescreen(context)) return 1440;
    if (isDesktop(context)) return 1200;
    if (isTablet(context)) return 768;
    return double.infinity;
  }
}

