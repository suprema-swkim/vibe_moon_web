import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';
import 'package:vibe_moon_web/components/widgets.dart';
import 'package:vibe_moon_web/pages/login/login_page_vm.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    // ViewModel의 컨트롤러 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(loginPageViewModelProvider.notifier);
      viewModel.emailController.addListener(() {
        viewModel.updateEmail(viewModel.emailController.text);
      });
      viewModel.passwordController.addListener(() {
        viewModel.updatePassword(viewModel.passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginPageViewModelProvider);
    final viewModel = ref.read(loginPageViewModelProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.pastelBgGradient,
        ),
        child: SafeArea(
          child: ResponsiveLayout(
            mobile: _buildMobileLayout(context, state, viewModel),
            tablet: _buildTabletLayout(context, state, viewModel),
            desktop: _buildDesktopLayout(context, state, viewModel),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    LoginPageState state,
    LoginPageViewModel viewModel,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSpacing.xxl),
          _buildLoginCard(context, state, viewModel, maxWidth: double.infinity),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    LoginPageState state,
    LoginPageViewModel viewModel,
  ) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: _buildLoginCard(context, state, viewModel, maxWidth: 480),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    LoginPageState state,
    LoginPageViewModel viewModel,
  ) {
    return Center(
      child: _buildLoginCard(context, state, viewModel, maxWidth: 480),
    );
  }

  Widget _buildLoginCard(
    BuildContext context,
    LoginPageState state,
    LoginPageViewModel viewModel, {
    required double maxWidth,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppEffects.radiusLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppEffects.blurMedium,
            sigmaY: AppEffects.blurMedium,
          ),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: AppEffects.glassCard(
              borderRadius: AppEffects.radiusLarge,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSpacing.xl),
                _buildEmailField(state, viewModel),
                const SizedBox(height: AppSpacing.md),
                _buildPasswordField(state, viewModel),
                const SizedBox(height: AppSpacing.lg),
                if (state.errorMessage != null) ...[
                  _buildErrorMessage(state.errorMessage!),
                  const SizedBox(height: AppSpacing.md),
                ],
                _buildLoginButton(state, viewModel),
                const SizedBox(height: AppSpacing.lg),
                _buildFooterLinks(context),
              ],
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
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.pastelPink.withOpacity(0.8),
                AppColors.pastelPurple.withOpacity(0.8),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.deepPurple.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.lock_outline_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          '로그인',
          style: AppTypography.h1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '계정에 로그인하여 시작하세요',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondaryLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField(LoginPageState state, LoginPageViewModel viewModel) {
    return GlassTextField(
      controller: viewModel.emailController,
      hintText: '이메일',
      errorText: state.emailError,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: AppColors.textSecondaryLight,
      ),
      onSubmitted: () {
        _handleLogin(viewModel);
      },
    );
  }

  Widget _buildPasswordField(
    LoginPageState state,
    LoginPageViewModel viewModel,
  ) {
    return GlassTextField(
      controller: viewModel.passwordController,
      hintText: '비밀번호',
      errorText: state.passwordError,
      obscureText: true,
      prefixIcon: const Icon(
        Icons.lock_outline_rounded,
        color: AppColors.textSecondaryLight,
      ),
      onSubmitted: () {
        _handleLogin(viewModel);
      },
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppEffects.radiusSmall),
        border: Border.all(
          color: AppColors.error.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.error,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
    LoginPageState state,
    LoginPageViewModel viewModel,
  ) {
    return GlassButton(
      text: '로그인',
      isLoading: state.isLoading,
      onPressed: state.isLoading ? null : () => _handleLogin(viewModel),
      width: double.infinity,
    );
  }

  Widget _buildFooterLinks(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _showComingSoonSnackBar(context, '비밀번호 찾기');
              },
              child: Text(
                '비밀번호 찾기',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '계정이 없으신가요?',
              style: AppTypography.bodySmall,
            ),
            TextButton(
              onPressed: () {
                _showComingSoonSnackBar(context, '회원가입');
              },
              child: Text(
                '회원가입',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _handleLogin(LoginPageViewModel viewModel) async {
    final success = await viewModel.login();
    if (success && mounted) {
      context.go('/home');
    }
  }

  void _showComingSoonSnackBar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature 기능은 준비 중입니다'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppEffects.radiusSmall),
        ),
        margin: const EdgeInsets.all(AppSpacing.md),
      ),
    );
  }
}
