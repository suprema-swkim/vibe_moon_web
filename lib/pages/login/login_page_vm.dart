import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

/// 로그인 상태
class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool rememberMe;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.rememberMe = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? rememberMe,
    bool clearError = false,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

/// 로그인 ViewModel
class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(const LoginState());

  /// 이메일 형식 검증
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return '이메일을 입력해주세요';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return '올바른 이메일 형식을 입력해주세요';
    }

    return null;
  }

  /// 비밀번호 검증
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    if (password.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다';
    }

    return null;
  }

  /// 로그인 상태 유지 토글
  void toggleRememberMe() {
    state = state.copyWith(rememberMe: !state.rememberMe);
    developer.log(
      'Remember me toggled: ${state.rememberMe}',
      name: 'LoginViewModel',
    );
  }

  /// 로그인 수행 (API 없이 검증만)
  Future<bool> login(String email, String password) async {
    // 에러 메시지 초기화
    state = state.copyWith(clearError: true);

    // 이메일 검증
    final emailError = validateEmail(email);
    if (emailError != null) {
      state = state.copyWith(errorMessage: emailError);
      return false;
    }

    // 비밀번호 검증
    final passwordError = validatePassword(password);
    if (passwordError != null) {
      state = state.copyWith(errorMessage: passwordError);
      return false;
    }

    // 로딩 시작
    state = state.copyWith(isLoading: true);

    try {
      // API 호출 시뮬레이션 (1초 대기)
      await Future.delayed(const Duration(seconds: 1));

      developer.log(
        'Login successful - Email: $email, RememberMe: ${state.rememberMe}',
        name: 'LoginViewModel',
      );

      // 로딩 종료
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      developer.log(
        'Login failed: $e',
        name: 'LoginViewModel',
        error: e,
      );

      state = state.copyWith(
        isLoading: false,
        errorMessage: '로그인 중 오류가 발생했습니다',
      );
      return false;
    }
  }

  /// 에러 메시지 초기화
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

/// 로그인 ViewModel Provider
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel();
});

