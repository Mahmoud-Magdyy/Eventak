import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_app_bar.dart';
import 'package:eventak/features/on_borading/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const OnBoardingAppBar(),
              OnBoardingBody(),
            ],
          ),
        ),
      ),
    );
  }
}
