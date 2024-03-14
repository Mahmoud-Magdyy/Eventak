import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delayedNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesLogo),
          ],
        ),
      ),
    );
  }
}

void delayedNavigate(context) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
  customReplacementNavigate(context, "/OnBoardingView");
    },
  );
}
