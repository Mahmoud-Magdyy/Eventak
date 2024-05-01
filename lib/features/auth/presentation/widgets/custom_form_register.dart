import 'package:eventak/core/locale/app_loacl.dart';
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
              // customReplacementNavigate(context, '/BottomNavBar');

        }
        else if (state is SignUpError) {
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
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  hint: AppStrings.userName.tr(context),
                  controller: registerCubit.userNameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                //!email
                CustomTextFormField(
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.email_outlined),
                  hint: AppStrings.email.tr(context),
                  controller: registerCubit.emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                //!phone
                CustomTextFormField(
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.local_phone_outlined),
                  hint: AppStrings.phone.tr(context),
                  controller: registerCubit.phoneController,
                ),
                const SizedBox(
                  height: 16,
                ),
                //!password
                CustomTextFormField(
                  maxLines: 1,
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
                ),
                const SizedBox(
                  height: 16,
                ),
                //!confirm password
                CustomTextFormField(
                  maxLines: 1,
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
                ),
                const SizedBox(
                  height: 32,
                ),
                state is SignUpLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                    : CustomElevetedButton(
                        onPressed: () {
                          if (registerCubit.registerKey.currentState!
                              .validate()) {
                            //! ally haytnafz lw l values kolha da5lt sa7
                            // registerCubit.login();
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
