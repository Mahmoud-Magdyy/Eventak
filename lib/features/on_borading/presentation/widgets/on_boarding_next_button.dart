
import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key, this.onPressed,
  });
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: IconButton(
        onPressed: onPressed,
        icon:  const Icon(
          FontAwesomeIcons.angleRight,
          color: Colors.white,
          size: 20,
        ),
        color: Colors.white,
      ),
    );
  }
}
