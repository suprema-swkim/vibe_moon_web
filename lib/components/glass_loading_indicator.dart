import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';

class GlassLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final String? message;

  const GlassLoadingIndicator({
    super.key,
    this.size = 48.0,
    this.color,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppEffects.blurMedium,
            sigmaY: AppEffects.blurMedium,
          ),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: AppEffects.glassCard(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: size,
                  height: size,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      color ?? AppColors.deepPurple,
                    ),
                  ),
                ),
                if (message != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    message!,
                    style: AppTypography.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

