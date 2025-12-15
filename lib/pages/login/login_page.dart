import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';
import 'package:vibe_moon_web/components/widgets.dart';
import 'package:vibe_moon_web/core/core.dart';
import 'dart:developer' as developer;
import 'login_page_vm.dart';

/// 로그인 페이지
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final viewModel = ref.read(loginViewModelProvider.notifier);
    final success = await viewModel.login(
      _emailController.text,
      _passwordController.text,
    );

    if (success && mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);
    final cardWidth = ResponsiveHelper.getResponsiveValue(
      context,
      mobile: double.infinity,
      tablet: 400.0,
      desktop: 400.0,
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkBgGradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: ResponsiveHelper.getResponsivePadding(context),
            child: SizedBox(
              width: cardWidth,
              child: Form(
                key: _formKey,
                child: GlassCard(
                  padding: const EdgeInsets.all(AppSpacing.glassCardPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 로고/타이틀
                      _buildHeader(),
                      const SizedBox(height: AppSpacing.xl),

                      // 에러 메시지
                      if (loginState.errorMessage != null) ...[
                        _buildErrorMessage(loginState.errorMessage!),
                        const SizedBox(height: AppSpacing.md),
                      ],

                      // 이메일 입력
                      GlassTextField(
                        label: '이메일',
                        hint: 'example@email.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.textSecondary,
                        ),
                        validator: ref
                            .read(loginViewModelProvider.notifier)
                            .validateEmail,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // 비밀번호 입력
                      GlassTextField(
                        label: '비밀번호',
                        hint: '최소 8자 이상',
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.textSecondary,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: ref
                            .read(loginViewModelProvider.notifier)
                            .validatePassword,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // 로그인 상태 유지 체크박스
                      _buildRememberMeCheckbox(loginState.rememberMe),
                      const SizedBox(height: AppSpacing.lg),

                      // 로그인 버튼
                      GlassButton(
                        text: '로그인',
                        onPressed: loginState.isLoading ? null : _handleLogin,
                        isLoading: loginState.isLoading,
                        width: double.infinity,
                        height: 56,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // 비밀번호 찾기
                      Center(
                        child: TextButton(
                          onPressed: () {
                            developer.log(
                              'Forgot password clicked',
                              name: 'LoginPage',
                            );
                          },
                          child: Text(
                            '비밀번호를 잊으셨나요?',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),

                      // 회원가입 링크
                      _buildSignupLink(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.nightlight_round,
            size: 48,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Vibe Moon',
          style: AppTypography.h2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          '로그인하여 계속하기',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.errorGlass,
        borderRadius: BorderRadius.circular(AppEffects.radiusSmall),
        border: Border.all(
          color: AppColors.errorSolid.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.errorSolid,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.errorSolid,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMeCheckbox(bool rememberMe) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: rememberMe,
            onChanged: (_) {
              ref.read(loginViewModelProvider.notifier).toggleRememberMe();
            },
            activeColor: AppColors.primarySolid,
            checkColor: AppColors.textPrimary,
            side: const BorderSide(
              color: AppColors.borderGlass,
              width: 1.5,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          '로그인 상태 유지',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSignupLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '계정이 없으신가요?',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            developer.log(
              'Signup clicked',
              name: 'LoginPage',
            );
          },
          child: Text(
            '회원가입',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primarySolid,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

