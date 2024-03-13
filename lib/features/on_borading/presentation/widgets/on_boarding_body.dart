import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/on_borading/data/models/on_boarding_model.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_next_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(onBoardingData[index].imagePath),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  onBoardingData[index].title,
                  style: AppStyles.styleBold36(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(onBoardingData[index].subTitle,
                    style: AppStyles.styleMedium18(context)),
                const SizedBox(
                  height: 66,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const SwapEffect(),
                    ),
                    const OnBoardingNextButton()
                  ],
                ),
              ],
            );
          }),
    );
  }
}
