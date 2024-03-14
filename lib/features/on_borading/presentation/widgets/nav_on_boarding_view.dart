import 'package:eventak/features/on_borading/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_next_button.dart';
import 'package:flutter/material.dart';

class NavOnBoardingView extends StatelessWidget {
  const NavOnBoardingView({
    super.key,
    required this.controller,
  });

  final PageController controller;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSmoothPageIndicator(controller: controller),
        OnBoardingNextButton(
          onPressed: () {
            controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn);
          },
        ),
      ],
    );
  }
}

