import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';

enum GlassButtonType {
  primary,
  secondary,
  outlined,
}

class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final GlassButtonType type;
  final double? width;
  final Widget? icon;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.type = GlassButtonType.primary,
    this.width,
    this.icon,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null && !widget.isLoading;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered && isEnabled ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppEffects.blurLight,
              sigmaY: AppEffects.blurLight,
            ),
            child: Container(
              width: widget.width,
              height: 56,
              decoration: _getDecoration(isEnabled),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isEnabled ? widget.onPressed : null,
                  child: Center(
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.icon != null) ...[
                                widget.icon!,
                                const SizedBox(width: AppSpacing.xs),
                              ],
                              Text(
                                widget.text,
                                style: _getTextStyle(isEnabled),
                              ),
                            ],
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

  BoxDecoration _getDecoration(bool isEnabled) {
    switch (widget.type) {
      case GlassButtonType.primary:
        return BoxDecoration(
          color: isEnabled
              ? AppColors.deepPurple
              : AppColors.deepPurple.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: AppColors.deepPurple.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        );
      case GlassButtonType.secondary:
        return BoxDecoration(
          color: isEnabled
              ? AppColors.glassSurfaceLight
              : AppColors.glassSurface,
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          border: Border.all(
            color: AppColors.borderGlassLight,
            width: 1.0,
          ),
        );
      case GlassButtonType.outlined:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          border: Border.all(
            color: isEnabled
                ? AppColors.deepPurple
                : AppColors.deepPurple.withOpacity(0.5),
            width: 2.0,
          ),
        );
    }
  }

  TextStyle _getTextStyle(bool isEnabled) {
    switch (widget.type) {
      case GlassButtonType.primary:
        return AppTypography.button.copyWith(
          color: isEnabled ? Colors.white : Colors.white.withOpacity(0.7),
        );
      case GlassButtonType.secondary:
        return AppTypography.button.copyWith(
          color: isEnabled
              ? AppColors.textPrimaryLight
              : AppColors.textSecondaryLight,
        );
      case GlassButtonType.outlined:
        return AppTypography.button.copyWith(
          color: isEnabled
              ? AppColors.deepPurple
              : AppColors.deepPurple.withOpacity(0.5),
        );
    }
  }
}

