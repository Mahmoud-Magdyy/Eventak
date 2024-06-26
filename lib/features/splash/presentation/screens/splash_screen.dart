import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
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
            
            Text(AppStrings.appName.tr(context), style: AppStyles.styleSemiBold20(context).copyWith(fontSize: 20))
          ],
        ),
      ),
    );
  }
}

void delayedNavigate(context) {
  Future.delayed(const Duration(seconds: 3)).then((value) async {
       await sl<CacheHelper>().getData(
                key: Apikeys.token,
              ) ==
              null
          ? 
          navigate(context: context, route: Routes.onBoardingView)
          : navigate(context: context, route: Routes.bottomNavBar);
    });
  
}
