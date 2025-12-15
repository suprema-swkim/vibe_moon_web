import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

/// 로그인 페이지 상태
class LoginPageState {
  final String email;
  final String password;
  final bool isLoading;
  final String? errorMessage;
  final String? emailError;
  final String? passwordError;

  LoginPageState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
    this.emailError,
    this.passwordError,
  });

  LoginPageState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errorMessage,
    String? emailError,
    String? passwordError,
  }) {
    return LoginPageState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      emailError: emailError,
      passwordError: passwordError,
    );
  }
}

/// 로그인 페이지 ViewModel
class LoginPageViewModel extends StateNotifier<LoginPageState> {
  LoginPageViewModel() : super(LoginPageState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// 이메일 업데이트
  void updateEmail(String email) {
    state = state.copyWith(
      email: email,
      emailError: null,
      errorMessage: null,
    );
  }

  /// 비밀번호 업데이트
  void updatePassword(String password) {
    state = state.copyWith(
      password: password,
      passwordError: null,
      errorMessage: null,
    );
  }

  /// 이메일 검증
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return '이메일을 입력해주세요';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return '올바른 이메일 형식을 입력해주세요';
    }

    return null;
  }

  /// 비밀번호 검증
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    if (password.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다';
    }

    return null;
  }

  /// 입력 검증
  bool _validateInputs() {
    final emailError = validateEmail(state.email);
    final passwordError = validatePassword(state.password);

    if (emailError != null || passwordError != null) {
      state = state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
      );
      return false;
    }

    return true;
  }

  /// 로그인 수행 (API 없이 시뮬레이션)
  Future<bool> login() async {
    developer.log('로그인 시도', name: 'LoginPageVM');

    // 입력 검증
    if (!_validateInputs()) {
      developer.log('입력 검증 실패', name: 'LoginPageVM');
      return false;
    }

    // 로딩 시작
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // API 호출 시뮬레이션 (2초 대기)
      await Future.delayed(const Duration(seconds: 2));

      // 간단한 로그인 로직 (데모용)
      // 실제로는 API 호출 결과에 따라 처리
      if (state.email == 'test@example.com' && state.password == 'password123') {
        developer.log('로그인 성공', name: 'LoginPageVM');
        state = state.copyWith(isLoading: false);
        return true;
      } else {
        // 모든 유효한 이메일/비밀번호 조합을 성공으로 처리 (데모용)
        developer.log('로그인 성공 (데모 모드)', name: 'LoginPageVM');
        state = state.copyWith(isLoading: false);
        return true;
      }
    } catch (e, stackTrace) {
      developer.log(
        '로그인 실패',
        name: 'LoginPageVM',
        error: e,
        stackTrace: stackTrace,
      );

      state = state.copyWith(
        isLoading: false,
        errorMessage: '로그인 중 오류가 발생했습니다. 다시 시도해주세요.',
      );
      return false;
    }
  }

  /// 에러 메시지 초기화
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

/// 로그인 페이지 ViewModel Provider
final loginPageViewModelProvider =
    StateNotifierProvider<LoginPageViewModel, LoginPageState>(
  (ref) => LoginPageViewModel(),
);

