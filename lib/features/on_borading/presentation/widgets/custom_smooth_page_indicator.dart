import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/on_borading/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBoardingData.length,
      effect: const SwapEffect(
          activeDotColor: AppColors.primaryColor,
          offset: BorderSide.strokeAlignCenter),
    );
  }
}
