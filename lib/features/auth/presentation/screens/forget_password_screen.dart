import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // customReplacementNavigate(context, '/SignIn');
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  AppStrings.forgetPasswordTitle.tr(context),
                  style: AppStyles.styleBold40(context),
                ),
                const SizedBox(
                  height: 32,
                ),
                Center(child: SvgPicture.asset(Assets.imagesForgotPassword)),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.forgetPasswordSubTitle.tr(context),
                  style: AppStyles.styleSemiBold20(context),
                ),
                const SizedBox(height: 16,),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hint: AppStrings.email.tr(context),
                  
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomElevetedButton(
                  onPressed: () {
                    customReplacementNavigate(
                        context, "/PassResetVerification");
                  },
                  text: AppStrings.send.tr(context),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
