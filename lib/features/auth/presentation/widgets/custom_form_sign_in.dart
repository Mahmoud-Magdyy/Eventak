import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_state.dart';
import 'package:eventak/features/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
          customReplacementNavigate(context, '/BottomNavBar');
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Error')));
        }
      },
      builder: (context, state) {
        final signInCubit = BlocProvider.of<SignInCubit>(context);
        return Form(
            key: signInCubit.signInKey,
            child: Column(
              children: [
                CustomTextFormField(
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  controller: signInCubit.emailController,
                  hint: AppStrings.loginHint.tr(context),
                  validate: (data) {
                    if (data!.isEmpty || !data.contains('@gmail.com')) {
                      return AppStrings.pleaseEnterValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  controller: signInCubit.passwordController,
                  hint: AppStrings.password.tr(context),
                  validate: (data) {
                    if (data!.length < 6 || data.isEmpty) {
                      return AppStrings.pleaseEnterValidPassword.tr(context);
                    }
                    return null;
                  },
                ),
                ForgetPasswordTextButton(
                  onPressed: () {
                    customReplacementNavigate(context, '/ForgetPasswordScreen');
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomElevetedButton(
                        onPressed: () {
                          if (signInCubit.signInKey.currentState!.validate()) {
                            signInCubit.login();
                          }
                          // context.read<SignInCubit>().login();
                        },
                        text: AppStrings.signIn.tr(context),
                      ),
              ],
            ));
      },
    );
  }
}
