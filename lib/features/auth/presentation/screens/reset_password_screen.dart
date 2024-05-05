import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_form_reser_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordCodeSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            navigateReplacment(context: context, route: Routes.signIn);
          } else if (state is ResetPasswordCodeErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                        navigateReplacment(
                            context: context,
                            route: Routes.signIn);
                        // customReplacementNavigate(
                        //     context, '/PassResetVerification');
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.resetPassword.tr(context),
                      style: AppStyles.styleBold40(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(child: SvgPicture.asset(Assets.imagesResetPassword)),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        AppStrings.resetPasswordSubTitle.tr(context),
                        style: AppStyles.styleSemiBold20(context),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomResetPasswordForm(),
                    const SizedBox(
                      height: 18,
                    ),
                    state is ResetPasswordCodeLoadingState
                        ? const CircularProgressIndicator()
                        : CustomElevetedButton(
                            onPressed: () {
                              context.read<ResetPasswordCubit>().resetPasswrd();
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
          );
        },
      ),
    );
  }
}
