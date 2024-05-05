import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is SendCodeSuccessState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                      navigateReplacment(context: context, route: Routes.passResetVerification);
                } else if (state is SendCodeErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return Form(
                  key: context.read<ResetPasswordCubit>().resetPasswordKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      CustomBackButton(
                        onPressed: () {
                          navigateReplacment(context: context, route: Routes.signIn);
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
                      Center(
                          child: SvgPicture.asset(Assets.imagesForgotPassword)),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        AppStrings.forgetPasswordSubTitle.tr(context),
                        style: AppStyles.styleSemiBold20(context),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: context
                            .read<ResetPasswordCubit>()
                            .emailForgetPasswordController,
                        hint: AppStrings.email.tr(context),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      state is SendCodeLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ))
                          : CustomElevetedButton(
                              onPressed: () {
                                context.read<ResetPasswordCubit>().sendCode();
                              },
                              text: AppStrings.send.tr(context),
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
