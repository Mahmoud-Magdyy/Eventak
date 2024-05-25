import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomLinerButton extends StatelessWidget {
  const CustomLinerButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    required this.text,
    this.color,
    required this.gradient,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Gradient gradient;
  final String text;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  // final Function(bool)? onFocusChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        gradient: gradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
      height: height!,
      width: width!,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,

          // shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: AppStyles.styleSemiBold18(context).copyWith(color: color),
        ),
      ),
    );
  }
}
