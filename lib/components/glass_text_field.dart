import 'dart:ui';
import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';
import '../app/theme/app_effects.dart';
import '../app/theme/app_spacing.dart';
import '../app/theme/app_typography.dart';

/// 글래스모피즘 텍스트 입력 필드
class GlassTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;

  const GlassTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
  });

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTypography.label.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isFocused
                ? AppColors.glassSurfaceDark
                : AppColors.glassSurface,
            borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
            border: Border.all(
              color: _isFocused
                  ? AppColors.borderGlassDark
                  : AppColors.borderGlass,
              width: 1.0,
            ),
            boxShadow: [
              if (_isFocused)
                const BoxShadow(
                  color: AppColors.primaryGlass,
                  blurRadius: 15,
                  offset: Offset(0, 4),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppEffects.blurLight,
                sigmaY: AppEffects.blurLight,
              ),
              child: TextFormField(
                controller: widget.controller,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                maxLines: widget.maxLines,
                style: AppTypography.bodyMedium,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                ),
                onTap: () => setState(() => _isFocused = true),
                onTapOutside: (_) => setState(() => _isFocused = false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

