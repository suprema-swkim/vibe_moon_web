import 'package:flutter/material.dart';

/// 애니메이션 상수
class AnimationConstants {
  // === Duration ===
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // === Curves ===
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve smoothCurve = Curves.easeInOutCubic;
  static const Curve bounceCurve = Curves.elasticOut;
  static const Curve snapCurve = Curves.easeOutExpo;

  // === Glass Effect Animations ===
  static const Duration glassHover = Duration(milliseconds: 200);
  static const Duration glassFocus = Duration(milliseconds: 250);
  static const Duration glassBlur = Duration(milliseconds: 300);
}

