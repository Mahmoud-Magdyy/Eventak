import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/on_borading/presentation/widgets/nav_on_boarding_view.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_app_bar.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              OnBoardingAppBar(
                currentIndex: currentIndex,
              onTap: () {
                controller.jumpToPage(3);
              },),
              OnBoardingBody(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              currentIndex == 3
          ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(onPressed: (){}, text: AppStrings.register,height: 50,width: 155,),
              CustomButton(onPressed: (){}, text: AppStrings.signUp,height: 50,width: 155,),
            ],
          )
                  : NavOnBoardingView(
                      controller: controller,
                    ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

