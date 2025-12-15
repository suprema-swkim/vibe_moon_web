import 'package:flutter/foundation.dart';

/// 웹 성능 최적화 유틸리티
class WebOptimizer {
  // === 이미지 최적화 설정 ===
  static const int maxImageWidth = 1920;
  static const int maxImageHeight = 1080;
  static const int imageQuality = 85;

  /// 블러 효과 성능 최적화
  /// 웹에서는 과도한 블러가 성능 저하를 일으킬 수 있음
  static double getOptimizedBlur(double blur) {
    if (kIsWeb) {
      return blur > 30 ? 30 : blur;
    }
    return blur;
  }

  /// 그라데이션 최적화 여부
  /// 저사양 기기에서는 단순 그라데이션 사용
  static bool shouldUseSimpleGradient() {
    return kIsWeb && !kDebugMode;
  }

  /// 애니메이션 최적화
  /// 웹에서는 애니메이션을 약간 빠르게
  static Duration getOptimizedDuration(Duration duration) {
    if (kIsWeb) {
      return Duration(milliseconds: (duration.inMilliseconds * 0.8).round());
    }
    return duration;
  }

  /// 이미지 캐시 크기 최적화
  static int getOptimizedCacheSize() {
    if (kIsWeb) {
      return 100; // 웹에서는 캐시 크기 제한
    }
    return 1000; // 네이티브에서는 더 큰 캐시
  }

  /// 리스트 아이템 최적화 (한 번에 렌더링할 아이템 수)
  static int getOptimizedItemCount() {
    if (kIsWeb) {
      return 20; // 웹에서는 적게
    }
    return 50; // 네이티브에서는 많이
  }
}

