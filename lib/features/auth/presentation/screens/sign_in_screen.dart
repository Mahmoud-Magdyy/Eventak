import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_form_sign_in.dart';
import 'package:eventak/features/auth/presentation/widgets/dont_have_and_register.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  
  
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
              const CustomBackButton(),
              const SizedBox(
                height: 76,
              ),
              Text(
                AppStrings.signInTitle.tr(context),
                style: AppStyles.styleBold36(context).copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppStrings.signInSubTitle.tr(context),
                style: AppStyles.styleMedium24(context).copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 56,
              ),
              const CustomSignInForm(),
              
              DontHaveAndRegistr(
                  dontHave: AppStrings.dontHaveAcc,
                  textButton: AppStrings.register,
                  onPressed: () {
                    navigateReplacment(context: context, route: Routes.registerScreen);
                    // customNavigate(context, '/RegisterScreen');
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
