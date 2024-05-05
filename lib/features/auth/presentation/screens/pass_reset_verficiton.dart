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
import 'package:eventak/features/auth/presentation/widgets/dont_have_and_register.dart';
import 'package:eventak/features/auth/presentation/widgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PassResetVerification extends StatelessWidget {
  const PassResetVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is RecevedCodeSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            navigateReplacment(context: context, route: Routes.resetPassword);
            // customReplacementNavigate(context, '/SignIn');
            // Navigator.pop(context);
          } else if (state is RecevedCodeErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                        navigateReplacment(
                            context: context, route: Routes.forgetPassword);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.passResetVerification.tr(context),
                      style: AppStyles.styleBold40(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(child: SvgPicture.asset(Assets.imagesVerification)),
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
                      height: 20,
                    ),
                    const DontHaveAndRegistr(
                        textButton: AppStrings.resend,
                        dontHave: AppStrings.dontCode),
                    const SizedBox(
                      height: 20,
                    ),
                    State is RecevedCodeLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomElevetedButton(
                            onPressed: () {
                              // context.read<ResetPasswordCubit>().receivedCode(context.read<ResetPasswordCubit>().finalOtp);
                              // customReplacementNavigate(context, '/4ResetPasswordScreen');
                            },
                            text: AppStrings.verify.tr(context),
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
