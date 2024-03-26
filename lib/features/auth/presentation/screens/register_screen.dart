import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_form_register.dart';
import 'package:eventak/features/auth/presentation/widgets/dont_have_and_register.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  height: 24,
                ),
                 CustomBackButton(
                  onPressed: (){
                    customReplacementNavigate(context, '/SignIn');
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppStrings.registerTitle.tr(context),
                  style: AppStyles.styleBold36(context).copyWith(fontSize: 28),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppStrings.registerSubTitle.tr(context),
                  style:
                      AppStyles.styleMedium24(context).copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 32,
                ),
                const CustomFormRegister(),
                 DontHaveAndRegistr(
                  dontHave: AppStrings.alredyHaveAcc,
                  textButton: AppStrings.login,
                  onPressed: (){
                    customReplacementNavigate(context, '/SignIn');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
