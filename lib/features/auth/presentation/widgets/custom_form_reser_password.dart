import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        final resetCubit = BlocProvider.of<ResetPasswordCubit>(context);
        return Form(
            key: resetCubit.resetPasswordKey,
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock_outlined),
                  controller: resetCubit.passwordController,
                  hint: AppStrings.password.tr(context),
                  passwordIsVisable: resetCubit.isResetPasswordsShowing,
                  icon: resetCubit.suffixIcon,
                  suffixIconColor: resetCubit.isResetPasswordsShowing
                      ? AppColors.lightBlue
                      : AppColors.deepBlue,
                  suffixIconOnPressed: () {
                    resetCubit.changeResetPasswordSuffixIcon();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  controller: resetCubit.confirmPasswordController,
                  hint: AppStrings.confirmPassword.tr(context),
                  passwordIsVisable: resetCubit.isConfirmResetPasswordsShowing,
                  icon: resetCubit.suffixIcon,
                  suffixIconColor: resetCubit.isConfirmResetPasswordsShowing
                      ? AppColors.lightBlue
                      : AppColors.deepBlue,
                  suffixIconOnPressed: () {
                    resetCubit.changeConfirmPasswordSuffixIcon();
                  },
                ),
              ],
            ));
      },
    );
  }
}
