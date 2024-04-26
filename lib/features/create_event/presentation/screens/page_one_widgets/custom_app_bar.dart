import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class CustomCreateEventAppBar extends StatelessWidget {
  const CustomCreateEventAppBar({
    super.key, this.nextOnPressed,
  });
final Function()? nextOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomTextButton(
          text: AppStrings.cancel,
          textColor: Color(0xFFFF0E00),
        ),
        // TextButton(onPressed: (){}, child: const Text('Cancel')),
        Text(
          AppStrings.newEvent.tr(context),
          style: AppStyles.styleSemiBold16(context),
        ),
         CustomTextButton(
          onPressed:nextOnPressed ,
          text: AppStrings.next,
          textColor:const Color(0xFF1462D8),
        ),
      ],
    );
  }
}
