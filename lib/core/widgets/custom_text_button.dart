import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.alignment,
    required this.text, this.textColor, this.fontSize, this.onPressed,
  });
  final AlignmentGeometry? alignment;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.tr(context),
          style: AppStyles.styleSemiBold16(context).copyWith(color:textColor ,
          fontSize:fontSize ),
        ),
      ),
    );
  }
}
