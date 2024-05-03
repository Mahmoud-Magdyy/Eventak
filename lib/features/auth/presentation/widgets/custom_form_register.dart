import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormRegister extends StatelessWidget {
  const CustomFormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
          navigateReplacment(context: context, route: Routes.signIn);
          // Navigator.pop(context);
          // customReplacementNavigate(context, '/SignIn');
          // Navigator.pop(context);
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Error')));
        }
      },
      builder: (context, state) {
        final registerCubit = BlocProvider.of<RegisterCubit>(context);
        return Form(
            key: registerCubit.registerKey,
            child: Column(
              children: [
                //!username
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  hint: AppStrings.userName.tr(context),
                  controller: registerCubit.userNameController,
                  validate: (data) {
                    if (data!.length < 3 || data.isEmpty) {
                      return 'Please enter valid username atleast 3 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //!email
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hint: AppStrings.email.tr(context),
                  controller: registerCubit.emailController,
                  validate: (data) {
                    if (data!.isEmpty || !data.contains('@gmail.com')) {
                      return AppStrings.pleaseEnterValidEmail.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //!password
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hint: AppStrings.password.tr(context),
                  controller: registerCubit.passwordController,
                  passwordIsVisable: registerCubit.isLoginPasswordsShowing,
                  icon: registerCubit.suffixIcon,
                  suffixIconColor: registerCubit.isLoginPasswordsShowing
                      ? AppColors.lightBlue
                      : AppColors.deepBlue,
                  suffixIconOnPressed: () {
                    registerCubit.changeLoginPasswordSuffixIcon();
                  },
                  validate: (data) {
                    if (data!.length < 6 || data.isEmpty) {
                      return AppStrings.pleaseEnterValidPassword.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //!confirm password
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.sync_lock_sharp),
                  hint: AppStrings.confirmPassword.tr(context),
                  controller: registerCubit.confirmPasswordController,
                  passwordIsVisable: registerCubit.isConfirmPasswordsShowing,
                  icon: registerCubit.suffixIcon,
                  suffixIconColor: registerCubit.isConfirmPasswordsShowing
                      ? AppColors.lightBlue
                      : AppColors.deepBlue,
                  suffixIconOnPressed: () {
                    registerCubit.changeConfirmPasswordSuffixIcon();
                  },
                  validate: (data) {
                    if (data != registerCubit.passwordController.text) {
                      return AppStrings.pleaseEnterValidPassword.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                state is SignUpLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : CustomElevetedButton(
                        onPressed: () {
                          if (registerCubit.registerKey.currentState!
                              .validate()) {
                            registerCubit.signUp();
                          }
                        },
                        text: AppStrings.signUp.tr(context),
                        color: Colors.white,
                      ),
              ],
            ));
      },
    );
  }
}
