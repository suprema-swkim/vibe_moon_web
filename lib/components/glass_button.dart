import 'dart:ui';
import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';
import '../app/theme/app_effects.dart';
import '../app/theme/app_spacing.dart';
import '../app/theme/app_typography.dart';

/// 글래스모피즘 버튼
class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final GlassButtonType type;
  final IconData? icon;
  final double? width;
  final double height;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.type = GlassButtonType.primary,
    this.icon,
    this.width,
    this.height = 48,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: _getDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppEffects.blurMedium,
              sigmaY: AppEffects.blurMedium,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isLoading ? null : widget.onPressed,
                borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                  child: _buildContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.textPrimary,
          ),
        ),
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: 20, color: AppColors.textPrimary),
          const SizedBox(width: AppSpacing.sm),
          Text(widget.text, style: AppTypography.button),
        ],
      );
    }

    return Center(
      child: Text(widget.text, style: AppTypography.button),
    );
  }

  BoxDecoration _getDecoration() {
    switch (widget.type) {
      case GlassButtonType.primary:
        return BoxDecoration(
          gradient: _isHovered
              ? AppColors.primaryGradient
              : const LinearGradient(
                  colors: [
                    AppColors.primaryGlass,
                    AppColors.secondaryGlass,
                  ],
                ),
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          border: Border.all(
            color: _isHovered
                ? AppColors.borderGlassDark
                : AppColors.borderGlass,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primaryGlass
                  : AppColors.shadowLight,
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        );

      case GlassButtonType.secondary:
        return BoxDecoration(
          color: _isHovered
              ? AppColors.glassSurfaceDark
              : AppColors.glassSurface,
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          border: Border.all(
            color: _isHovered
                ? AppColors.borderGlassDark
                : AppColors.borderGlass,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: _isHovered ? 15 : 10,
              offset: Offset(0, _isHovered ? 6 : 4),
            ),
          ],
        );

      case GlassButtonType.outlined:
        return BoxDecoration(
          color: _isHovered
              ? AppColors.glassSurfaceLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          border: Border.all(
            color: _isHovered
                ? AppColors.borderGlassDark
                : AppColors.borderGlass,
            width: 1.5,
          ),
        );
    }
  }
}

enum GlassButtonType { primary, secondary, outlined }

