import 'package:flutter/material.dart';
import '../constants/animation_constants.dart';

/// 애니메이션 헬퍼 유틸리티
class AnimationHelper {
  /// 글래스 카드 호버 스케일 효과
  static Widget buildHoverScale({
    required Widget child,
    double scale = 1.02,
    Duration duration = AnimationConstants.fast,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: scale),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// 페이드 인 애니메이션
  static Widget buildFadeIn({
    required Widget child,
    Duration duration = AnimationConstants.normal,
    Duration delay = Duration.zero,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// 슬라이드 업 애니메이션
  static Widget buildSlideUp({
    required Widget child,
    Duration duration = AnimationConstants.normal,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: offset, end: 0.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: Opacity(
            opacity: 1.0 - (value / offset),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// 슬라이드 인 (좌측에서)
  static Widget buildSlideInLeft({
    required Widget child,
    Duration duration = AnimationConstants.normal,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: -offset, end: 0.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Opacity(
            opacity: 1.0 - (value.abs() / offset),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// 슬라이드 인 (우측에서)
  static Widget buildSlideInRight({
    required Widget child,
    Duration duration = AnimationConstants.normal,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: offset, end: 0.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Opacity(
            opacity: 1.0 - (value.abs() / offset),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// 스케일 인 애니메이션
  static Widget buildScaleIn({
    required Widget child,
    Duration duration = AnimationConstants.normal,
    double begin = 0.8,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

