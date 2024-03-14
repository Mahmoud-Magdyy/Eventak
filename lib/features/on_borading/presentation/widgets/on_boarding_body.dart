import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/on_borading/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580,
      child: PageView.builder(
        onPageChanged: onPageChanged,
          controller: controller,
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: FittedBox(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(onBoardingData[index].imagePath))),
                    ),
                  ),
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
              ],
            );
          }),
    );
  }
}
