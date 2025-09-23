import 'package:flutter/material.dart';

class SuperButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconPosition iconPosition;
  final MainAxisAlignment alignment;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;
  final double iconSpacing;

  const SuperButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    this.width,
    this.height,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.iconSpacing = 8.0,
    this.alignment = MainAxisAlignment.center,
    this.border,
    this.shadow,
    this.gradient,
  }) : assert(
         text != null || child != null,
         'Must provide either text or child',
       );

  static const IconPosition start = IconPosition.start;
  static const IconPosition end = IconPosition.end;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        border: border,
        boxShadow: shadow,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: gradient != null
              ? Colors.transparent
              : backgroundColor,
          foregroundColor: foregroundColor,
          disabledForegroundColor: disabledColor ?? theme.disabledColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading ? const CircularProgressIndicator() : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (child != null) return child!;

    final List<Widget> children = [];

    if (icon != null && iconPosition == IconPosition.start) {
      children.add(icon!);
      children.add(SizedBox(width: iconSpacing));
    }

    children.add(
      Text(
        text!,
        style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w600),
      ),
    );

    if (icon != null && iconPosition == IconPosition.end) {
      children.add(SizedBox(width: iconSpacing));
      children.add(icon!);
    }

    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

enum IconPosition { start, end }
