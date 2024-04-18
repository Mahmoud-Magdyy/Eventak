
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key, this.onPressed,
  });
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 106,
      decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: TextButton(onPressed: onPressed, child: Text(AppStrings.next.tr(context),style: AppStyles.styleSemiBold18(context),))
    );
  }
}
