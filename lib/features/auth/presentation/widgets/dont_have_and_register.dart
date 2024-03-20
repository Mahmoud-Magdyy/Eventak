import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class DontHaveAndRegistr extends StatelessWidget {
  const DontHaveAndRegistr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAcc.tr(context),
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.grey),
        ),
        const CustomTextButton(text: AppStrings.register)
      ],
    );
  }
}
