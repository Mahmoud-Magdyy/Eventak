import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
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
              .showSnackBar(SnackBar(content: Text(state.message)));
              navigateReplacment(context: context, route: Routes.bottomNavBar);
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Form(
            key: context.read<SignInCubit>().signInKey,
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  controller: context.read<SignInCubit>().emailController,
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
                  controller: context.read<SignInCubit>().passwordController,
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
                    navigate(context: context, route: Routes.forgetPassword);
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomElevetedButton(
                        onPressed: () {
                          if (context.read<SignInCubit>().signInKey.currentState!.validate()) {
                            context.read<SignInCubit>().login();
                          }
                        },
                        text: AppStrings.signIn.tr(context),
                      ),
              ],
            ));
      },
    );
  }
}
