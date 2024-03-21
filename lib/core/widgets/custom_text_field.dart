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
    this.suffixIconOnPressed, this.prefixIcon, this.onChanged, this.onFieldSubmitted,
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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted:onFieldSubmitted ,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      validator: validate,
      obscureText: passwordIsVisable,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.lightBlue,
          contentPadding:  const EdgeInsets.all(16),
          hintText: hint,
          hintStyle: AppStyles.styleMedium16(context),
          labelText: label,
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(icon),
            color: AppColors.lightBlue,
          )),
    );
  }
}
