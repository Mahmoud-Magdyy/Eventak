import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_form_reser_password.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                CustomBackButton(
                  onPressed: () {
                    customReplacementNavigate(
                        context, '/PassResetVerification');
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppStrings.resetPassword.tr(context),
                  style: AppStyles.styleMedium40(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(Assets.imagesOn1),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    AppStrings.resetPasswordSubTitle.tr(context),
                    style: AppStyles.styleSemiBold20(context),
                  ),
                ),
                const CustomResetPasswordForm(),
                const SizedBox(
                  height: 18,
                ),
                CustomElevetedButton(
                  onPressed: () {
                    // customReplacementNavigate(
                    //     context, "/PassResetVerification");
                  },
                  text: AppStrings.reset.tr(context),
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

