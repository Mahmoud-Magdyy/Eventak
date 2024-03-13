import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.imagePath, required this.title, required this.subTitle});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: AppStrings.onBoradingTitle1,
    subTitle: AppStrings.onBoradingSubTitle1,
    imagePath: Assets.imagesOn1,
  ),
  OnBoardingModel(
    title: AppStrings.onBoradingTitle2,
    subTitle: AppStrings.onBoradingSubTitle2,
    imagePath: Assets.imagesOn2,
  ),
  OnBoardingModel(
    title: AppStrings.onBoradingTitle3,
    subTitle: AppStrings.onBoradingSubTitle3,
    imagePath: Assets.imagesOn3,
  ),
  OnBoardingModel(
    title: AppStrings.onBoradingTitle3,
    subTitle: AppStrings.onBoradingSubTitle3,
    imagePath: Assets.imagesOn3,
  ),
];
