import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_moon_web/core/utils/logger.dart';

/// Home 화면 상태
class HomePageState {
  final int counter;
  final bool isLoading;
  final String? errorMessage;

  const HomePageState({
    this.counter = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  HomePageState copyWith({
    int? counter,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomePageState(
      counter: counter ?? this.counter,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Home 화면 ViewModel
class HomePageViewModel extends StateNotifier<HomePageState> {
  HomePageViewModel() : super(const HomePageState());

  /// 카운터 증가
  void incrementCounter() {
    Logger.info('Counter incremented: ${state.counter} -> ${state.counter + 1}');
    state = state.copyWith(counter: state.counter + 1);
  }

  /// 카운터 감소
  void decrementCounter() {
    if (state.counter > 0) {
      Logger.info('Counter decremented: ${state.counter} -> ${state.counter - 1}');
      state = state.copyWith(counter: state.counter - 1);
    }
  }

  /// 카운터 초기화
  void resetCounter() {
    Logger.info('Counter reset');
    state = state.copyWith(counter: 0);
  }

  /// 비동기 작업 시뮬레이션
  Future<void> loadData() async {
    try {
      Logger.info('Loading data...');
      state = state.copyWith(isLoading: true, errorMessage: null);

      // 2초 대기 (API 호출 시뮬레이션)
      await Future.delayed(const Duration(seconds: 2));

      Logger.info('Data loaded successfully');
      state = state.copyWith(isLoading: false);
    } catch (e, stackTrace) {
      Logger.error('Failed to load data', error: e, stackTrace: stackTrace);
      state = state.copyWith(
        isLoading: false,
        errorMessage: '데이터 로드 실패: $e',
      );
    }
  }
}

/// Home 화면 ViewModel Provider
final homePageViewModelProvider =
    StateNotifierProvider<HomePageViewModel, HomePageState>((ref) {
  return HomePageViewModel();
});

