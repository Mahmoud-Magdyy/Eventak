import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.height=48, this.width=double.infinity, required this.onPressed, this.background, required this.text,
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String  text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
  width: width!,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .copyWith(
                backgroundColor:
                     MaterialStatePropertyAll(
                       background??AppColors.primaryColor)),
        child:  Text(text,style: AppStyles.styleSemiBold18(context),),
      ),
    );
  }
}
