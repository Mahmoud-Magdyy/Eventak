import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/bloc/cubit/global_state.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/on_borading/presentation/widgets/nav_on_boarding_view.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_app_bar.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  OnBoardingAppBar(
                    currentIndex: currentIndex,
                    onTap: () {
                      controller.jumpToPage(3);
                    },
                  ),
                  OnBoardingBody(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 88,
                  ),
                  currentIndex == 3
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onPressed: () {},
                              text: AppStrings.register,
                              height: 50,
                              width: 155,
                            ),
                            CustomButton(
                              background: Colors.white,
                              onPressed: () {},
                              text: AppStrings.signIn,
                              color: AppColors.primaryColor,
                              height: 50,
                              width: 155,
                            ),
                          ],
                        )
                      : NavOnBoardingView(
                          controller: controller,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
