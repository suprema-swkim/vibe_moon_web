import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';
import 'package:vibe_moon_web/components/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.pastelBgGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
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
                        children: [
                          _buildWelcomeSection(),
                          const SizedBox(height: AppSpacing.xl),
                          _buildInfoCards(),
                          const SizedBox(height: AppSpacing.xl),
                          _buildLogoutButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.pastelPink.withOpacity(0.8),
                AppColors.pastelPurple.withOpacity(0.8),
                AppColors.pastelBlue.withOpacity(0.8),
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
            Icons.check_circle_outline_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          '로그인 성공!',
          style: AppTypography.h1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          '환영합니다',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textSecondaryLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInfoCards() {
    return Column(
      children: [
        _buildInfoCard(
          icon: Icons.dashboard_outlined,
          title: '대시보드',
          description: '프로젝트 현황을 한눈에 확인하세요',
          color: AppColors.pastelPink,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildInfoCard(
          icon: Icons.people_outline_rounded,
          title: '팀 관리',
          description: '팀원들과 함께 협업하세요',
          color: AppColors.pastelPurple,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildInfoCard(
          icon: Icons.settings_outlined,
          title: '설정',
          description: '개인 설정을 관리하세요',
          color: AppColors.pastelBlue,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppEffects.blurLight,
          sigmaY: AppEffects.blurLight,
        ),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.glassSurface,
            borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
            border: Border.all(
              color: AppColors.borderGlassLight,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(AppEffects.radiusSmall),
                ),
                child: Icon(
                  icon,
                  color: AppColors.deepPurple,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.h3,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      description,
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GlassButton(
      text: '로그아웃',
      type: GlassButtonType.outlined,
      onPressed: () {
        context.go('/login');
      },
      width: double.infinity,
      icon: const Icon(
        Icons.logout_rounded,
        color: AppColors.deepPurple,
        size: 20,
      ),
    );
  }
}

