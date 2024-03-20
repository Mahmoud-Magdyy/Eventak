import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({
    super.key, required this.onPressed,
  });
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
     onPressed: onPressed,
       textColor: AppColors.primaryColor,
       fontSize: 14,
       text: AppStrings.forgetPassword,
       alignment: Alignment.centerRight);
  }
}
