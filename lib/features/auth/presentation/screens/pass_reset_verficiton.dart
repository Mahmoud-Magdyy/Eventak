import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/auth/presentation/widgets/dont_have_and_register.dart';
import 'package:eventak/features/auth/presentation/widgets/otp_widget.dart';
import 'package:flutter/material.dart';

class PassResetVerification extends StatelessWidget {
  const PassResetVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 26,
                ),
                CustomBackButton(
                  onPressed: () {
                    customReplacementNavigate(context, '/ForgetPasswordScreen');
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppStrings.passResetVerification.tr(context),
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
                  AppStrings.passResetVerificationSubTitle.tr(context),
                  style: AppStyles.styleSemiBold20(context),
                ),
                const OtpWidget(),
                const SizedBox(
                  height: 6,
                ),
                const DontHaveAndRegistr(
                    textButton: AppStrings.resend,
                    dontHave: AppStrings.dontCode),
                CustomElevetedButton(
                  onPressed: () {},
                  text: AppStrings.verify.tr(context),
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
