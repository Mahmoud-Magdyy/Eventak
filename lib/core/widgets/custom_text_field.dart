import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.passwordIsVisable = false,
    this.validate,
    this.icon,
    this.suffixIconOnPressed,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIconColor,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final IconData? icon;
  final Widget? prefixIcon;
  final VoidCallback? suffixIconOnPressed;
  final bool passwordIsVisable;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Color? suffixIconColor;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      validator: validate,
      obscureText: passwordIsVisable,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.lightBlue,
          contentPadding: const EdgeInsets.all(16),
          hintText: hint,
          hintStyle: AppStyles.styleMedium16(context),
          labelText: label,
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              icon,
              color: suffixIconColor,
            ),
            color: AppColors.lightBlue,
          )),
    );
  }
}
