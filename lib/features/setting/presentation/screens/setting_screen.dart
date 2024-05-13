import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/setting/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Text(''),
        title: Text(
          "Settings",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const CustomListTile(
              image: Assets.imagesNotificationsActive,
              title: "Notifications & Sounds",
            ),
            CustomListTile(
              onTap: () {
                navigate(context: context, route: Routes.privacyAndSecurity);
              },
              image: Assets.imagesShieldLocked,
              title: "Privacy & Security",
            ),
            CustomListTile(
              onTap: () {
                navigate(context: context, route: Routes.languageScreen);
              },
              image: Assets.imagesLanguage,
              title: "Language",
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomListTile(
              image: Assets.imagesHelp,
              title: "Eventak FAQ",
            ),
            const CustomListTile(
              image: Assets.imagesLightbulb,
              title: "Eventak Features",
            ),
            const Spacer(),
            CustomElevetedButton(
              onPressed: () {},
              text: 'Log Out',
              background: Colors.white,
              color: const Color(0xffFF655C),
            )
          ],
        ),
      ),
    );
  }
}
