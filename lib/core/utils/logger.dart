import 'dart:developer' as developer;

/// 로깅 유틸리티
class Logger {
  Logger._();

  /// 디버그 로그
  static void debug(String message, {String? name}) {
    developer.log(
      message,
      name: name ?? 'Debug',
      level: 500,
    );
  }

  /// 정보 로그
  static void info(String message, {String? name}) {
    developer.log(
      message,
      name: name ?? 'Info',
      level: 800,
    );
  }

  /// 경고 로그
  static void warning(String message, {String? name}) {
    developer.log(
      message,
      name: name ?? 'Warning',
      level: 900,
    );
  }

  /// 에러 로그
  static void error(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name ?? 'Error',
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

