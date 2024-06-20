import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_state.dart';
import 'package:eventak/features/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showTwist(
                          state: ToastStates.success,
                          messege: 'Login Successfuly');
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(state.message)));
           context.read<HomeCubit>().getAllEvents();
                  context.read<HomeCubit>().getTrendigEvents();
                  context.read<MyCreatedEventsCubit>().getMyCreatedEvents();
                  context.read<MyCreatedEventsCubit>().getRequestedMyEvents();
                  context.read<ProfileCubit>().getProfile();
                  context.read<ProfileCubit>().getMyFavouriteEvents();

          navigateReplacment(context: context, route: Routes.bottomNavBar);
          // print("token isss: ${sl<CacheHelper>().getData(key: 'token')}");
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
                  prefixIcon: const Icon(Icons.email_outlined),
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
                //!password
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hint: AppStrings.password.tr(context),
                  controller: context.read<SignInCubit>().passwordController,
                  passwordIsVisable: context.read<SignInCubit>().isLoginPasswordsShowing,
                  icon: context.read<SignInCubit>().suffixIcon,
                  suffixIconColor: context.read<SignInCubit>().isLoginPasswordsShowing
                      ? AppColors.lightBlue
                      : AppColors.deepBlue,
                  suffixIconOnPressed: ()async {
                    
                    context.read<SignInCubit>().changeLoginPasswordSuffixIcon();
                  },
                  validate: (data) {
                    if (data!.length < 6 || data.isEmpty) {
                      return AppStrings.pleaseEnterValidPassword.tr(context);
                    }
                    return null;
                  },
                ),
                ForgetPasswordTextButton(
                  onPressed: () {
                    navigateReplacment(
                        context: context, route: Routes.forgetPassword);
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                    : CustomElevetedButton(
                      
                        onPressed: () {
                          if (context
                              .read<SignInCubit>()
                              .signInKey
                              .currentState!
                              .validate()) {
                            setState(() {
                              context.read<SignInCubit>().login();
                            });
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
