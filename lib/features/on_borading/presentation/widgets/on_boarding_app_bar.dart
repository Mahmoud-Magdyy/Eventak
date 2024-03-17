import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
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
                height: 22,
              ),
        currentIndex != 3
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  AppStrings.skip.tr(context),
                  style:
                      AppStyles.styleRegular14(context).copyWith(fontSize: 14),
                ),
              )
            : GestureDetector(
                onTap: (){
                  customReplacementNavigate(context,'/OnBoardingView' );
                },
                child: Text(
                  AppStrings.back.tr(context),
                  style:
                      AppStyles.styleRegular14(context).copyWith(fontSize: 14),
                ),
              )
      ],
    );
  }
}
