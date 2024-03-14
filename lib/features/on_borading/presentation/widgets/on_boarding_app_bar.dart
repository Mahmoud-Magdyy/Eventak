import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/on_borading/presentation/widgets/english_and_arabic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentIndex == 0
            ? const EnglishAndArabicButton()
            : SvgPicture.asset(
                Assets.imagesSmallLogo,
                height: 30,
              ),
        currentIndex != 3
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  AppStrings.skip,
                  style:
                      AppStyles.styleRegular14(context).copyWith(fontSize: 18),
                ),
              )
            : GestureDetector(
                onTap: (){
                  
                },
                child: Text(
                  'Back',
                  style:
                      AppStyles.styleRegular14(context).copyWith(fontSize: 18),
                ),
              )
      ],
    );
  }
}
