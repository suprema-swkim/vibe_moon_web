import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';
import '../app/theme/app_spacing.dart';
import '../app/theme/app_typography.dart';
import 'glass_card.dart';

/// 글래스모피즘 로딩 인디케이터
class GlassLoadingIndicator extends StatelessWidget {
  final String? message;
  final bool showOverlay;

  const GlassLoadingIndicator({
    super.key,
    this.message,
    this.showOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: GlassCard(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primarySolid,
                ),
              ),
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.lg),
              Text(
                message!,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );

    if (showOverlay) {
      return Container(
        color: AppColors.bgDark.withOpacity(0.5),
        child: content,
      );
    }

    return content;
  }
}

