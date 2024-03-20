import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: MaterialStatePropertyAll(
          EdgeInsets.all(0),
        ),
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 24,
        color: AppColors.deepBlue,
      ),
    );
  }
}
