import 'package:flutter/material.dart';

/// BuildContext 확장 메서드
extension ContextExtension on BuildContext {
  /// 테마 데이터
  ThemeData get theme => Theme.of(this);

  /// 컬러 스킴
  ColorScheme get colorScheme => theme.colorScheme;

  /// 텍스트 테마
  TextTheme get textTheme => theme.textTheme;

  /// 미디어 쿼리
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// 화면 크기
  Size get screenSize => mediaQuery.size;

  /// 화면 너비
  double get screenWidth => screenSize.width;

  /// 화면 높이
  double get screenHeight => screenSize.height;

  /// 반응형: 모바일 여부
  bool get isMobile => screenWidth < 600;

  /// 반응형: 태블릿 여부
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  /// 반응형: 데스크톱 여부
  bool get isDesktop => screenWidth >= 1024;

  /// 스낵바 표시
  void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  /// 에러 스낵바 표시
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.error,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}

