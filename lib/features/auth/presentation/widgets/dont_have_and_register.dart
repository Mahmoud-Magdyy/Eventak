import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class DontHaveAndRegistr extends StatelessWidget {
  const DontHaveAndRegistr({
    super.key, required this.textButton, this.onPressed, required this.dontHave,
  });
final String textButton;
final String dontHave;
final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dontHave.tr(context),
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.grey),
        ),
         CustomTextButton(text: textButton,onPressed: onPressed,)
      ],
    );
  }
}
