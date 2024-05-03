import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/setting/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurity extends StatelessWidget {
  const PrivacyAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          "Privacy & Security",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            CustomListTile(
              onTap: () {},
              image: Assets.imagesFaceRecognitionActive,
              title: "Face Recognition",
            ),
            CustomListTile(
              onTap: () {},
              image: Assets.imagesOrangeKey,
              title: "Two-Step Verification",
            ),
            CustomListTile(
              onTap: () {},
              image: Assets.imagesEmail,
              title: "Change Email",
            ),
            CustomListTile(
              onTap: () {},
              image: Assets.imagesChangePassword,
              title: "Change Password",
            ),
            const SizedBox(height: 24,),
            CustomElevetedButton(onPressed: (){}, text: 'Delete Account', background: Colors.white, color: const Color(0xffFF655C),)
          ],
        ),
      ),
    );
  }
}
