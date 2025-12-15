import 'package:flutter/material.dart';
import '../core/utils/responsive_helper.dart';

/// 반응형 레이아웃 위젯
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? widescreen;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.widescreen,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isWidescreen(context)) {
      return widescreen ?? desktop ?? tablet ?? mobile;
    }
    if (ResponsiveHelper.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (ResponsiveHelper.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

