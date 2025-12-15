/// 앱 전역 상수
class AppConstants {
  AppConstants._();

  // 앱 정보
  static const String appName = 'Vibe Moon';
  static const String appVersion = '1.0.0';

  // 타임아웃
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 10);
  static const Duration longTimeout = Duration(seconds: 60);

  // 페이지네이션
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // UI 상수
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 8.0;
}

