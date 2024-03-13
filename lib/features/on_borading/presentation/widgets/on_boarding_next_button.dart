import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 56,
      decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40))),
      child: IconButton(
        onPressed: () {
          
        },
        icon:  const Icon(
      Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        color: Colors.white,
      ),
    );
  }
}
