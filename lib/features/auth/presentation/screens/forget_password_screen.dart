import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 26,
                ),
                const CustomBackButton(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppStrings.forgetPasswordTitle.tr(context),
                  style: AppStyles.styleMedium40(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(Assets.imagesOn1),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.forgetPasswordSubTitle.tr(context),
                  style: AppStyles.styleSemiBold20(context),
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hint: AppStrings.email.tr(context),),
                const SizedBox(
                  height: 24,
                ),
                CustomElevetedButton(
                  onPressed: () {},
                  text: AppStrings.send.tr(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
