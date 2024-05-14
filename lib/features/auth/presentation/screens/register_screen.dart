import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_back_button.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_state.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_form_register.dart';
import 'package:eventak/features/auth/presentation/widgets/custom_register_image.dart';
import 'package:eventak/features/auth/presentation/widgets/dont_have_and_register.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    CustomBackButton(
                      onPressed: () {
                        navigateReplacment(
                            context: context, route: Routes.signIn);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.registerTitle.tr(context),
                      style:
                          AppStyles.styleBold36(context).copyWith(fontSize: 28),
                    ),
                    Text(
                      AppStrings.registerSubTitle.tr(context),
                      style: AppStyles.styleMedium24(context)
                          .copyWith(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    BlocConsumer<CreateEventCubit, CreateEventState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final eventCubit =
                            BlocProvider.of<CreateEventCubit>(context);
                        return Center(child: CustomImage(eventCubit: eventCubit));
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const CustomFormRegister(),
                    DontHaveAndRegistr(
                      dontHave: AppStrings.alredyHaveAcc,
                      textButton: AppStrings.login,
                      onPressed: () {
                        navigateReplacment(
                            context: context, route: Routes.signIn);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
