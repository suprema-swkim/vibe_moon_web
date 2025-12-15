import 'dart:ui';
import 'package:flutter/material.dart';
import '../app/theme/app_effects.dart';
import '../app/theme/app_spacing.dart';

/// 글래스모피즘 카드
class GlassCard extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool enableHoverEffect;
  final double borderRadius;
  final Color? color;

  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.onTap,
    this.enableHoverEffect = true,
    this.borderRadius = AppEffects.radiusMedium,
    this.color,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.enableHoverEffect
          ? (_) => setState(() => _isHovered = true)
          : null,
      onExit: widget.enableHoverEffect
          ? (_) => setState(() => _isHovered = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: _isHovered && widget.enableHoverEffect
            ? AppEffects.glassCardHover(
                color: widget.color,
                borderRadius: widget.borderRadius,
              )
            : AppEffects.glassCard(
                color: widget.color,
                borderRadius: widget.borderRadius,
              ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppEffects.blurMedium,
              sigmaY: AppEffects.blurMedium,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: Padding(
                  padding: widget.padding ??
                      const EdgeInsets.all(AppSpacing.cardPadding),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

