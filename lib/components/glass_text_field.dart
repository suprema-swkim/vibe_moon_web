import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vibe_moon_web/app/theme/theme.dart';

class GlassTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const GlassTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
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
        ClipRRect(
          borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppEffects.blurMedium,
              sigmaY: AppEffects.blurMedium,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: _isFocused
                    ? AppColors.glassSurfaceLight
                    : AppColors.glassSurface,
                borderRadius: BorderRadius.circular(AppEffects.radiusMedium),
                border: Border.all(
                  color: widget.errorText != null
                      ? AppColors.error
                      : _isFocused
                          ? AppColors.deepPurple.withOpacity(0.5)
                          : AppColors.borderGlassLight,
                  width: _isFocused ? 2.0 : 1.0,
                ),
              ),
              child: TextField(
                controller: widget.controller,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,
                onSubmitted: (_) => widget.onSubmitted?.call(),
                style: AppTypography.bodyMedium,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textHint,
                  ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                ),
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _isFocused = false;
                  });
                },
              ),
            ),
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.sm),
            child: Text(
              widget.errorText!,
              style: AppTypography.caption.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

