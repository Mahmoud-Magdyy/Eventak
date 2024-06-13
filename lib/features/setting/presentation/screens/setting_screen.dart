import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:eventak/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:eventak/features/setting/presentation/cubit/setting_state.dart';
import 'package:eventak/features/setting/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccessState) {
          showTwist(messege: 'Email Is Deleted', state: ToastStates.success);
          navigateReplacment(context: context, route: Routes.signIn);
        }
        if (state is LogOutSuccessState) {
          showTwist(state: ToastStates.success, messege: state.message);
          context.read<HomeCubit>().currenIndex = 0;
          navigateReplacment(context: context, route: Routes.signIn);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfff4f4f4),
          appBar: AppBar(
            leading: const Text(''),
            title: Text(
              "Settings",
              style: AppStyles.styleBold18(context),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    CustomListTile(
                      image: Assets.imagesHelp,
                      title: "Eventak FAQ",
                      onTap: () {
                        navigate(context: context, route: Routes.faqScreen);
                      },
                    ),
                    CustomListTile(
                      image: Assets.imagesLightbulb,
                      title: "Eventak Features",
                      onTap: () {
                        navigate(context: context, route: Routes.featuresScreen);
                      },
                    ),
                    const Spacer(),
                    CustomElevetedButton(
                      onPressed: () {
                        context.read<SettingCubit>().logout();
                        context.read<ProfileCubit>().resetCubit();
                      },
                      text: 'Log Out',
                      background: Colors.white,
                      color: const Color(0xffFF655C),
                    ),
                    const SizedBox(height: 8),
                    CustomElevetedButton(
                      onPressed: () {
                        context.read<SettingCubit>().deleteAccount();
                      },
                      text: 'Delete Account',
                      background: Colors.white,
                      color: const Color(0xffFF655C),
                    ),
                  ],
                ),
              ),
              if (state is LogOutLoadingState || state is DeleteAccountLoadingState)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.primaryColor,),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
