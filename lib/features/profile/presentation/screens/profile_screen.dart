import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_liner_button.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:eventak/features/profile/presentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetProfilesLoadingState
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 21,
                          ),
                          Text(
                            'Profile',
                            style: AppStyles.styleBold18(context),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          ProfileImage(
                            image: context
                                .read<ProfileCubit>()
                                .profileModel!
                                .profilePic['secure_url'],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '${context
                                    .read<ProfileCubit>()
                                    .profileModel!
                                    .firstName} ${context
                                    .read<ProfileCubit>()
                                    .profileModel!
                                    .lastName}',
                            style: AppStyles.styleSemiBold18(context)
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(Assets.imagesCreated),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                          context
                                              .read<ProfileCubit>()
                                              .profileModel!
                                              .createdEvent
                                              .toString(),
                                          style:
                                              AppStyles.styleBold20(context)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('Events Create',
                                      style: AppStyles.styleMedium16(context)
                                          .copyWith(color: Colors.black)),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(Assets.imagesCreated),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text('03',
                                          style:
                                              AppStyles.styleBold20(context)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('Events Attend',
                                      style: AppStyles.styleMedium16(context)
                                          .copyWith(color: Colors.black)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomLinerButton(
                            gradient: const LinearGradient(
                              begin:Alignment(-1, 0.03) ,
                              end:Alignment(1.00, -0.03) ,
                              colors: [Color(0xFF1C5CA8), Color(0xFF2E88F2)],
                            ),
                            onPressed: () {
                              navigate(
                                  context: context,
                                  route: Routes.editProfileScreen);
                            },
                            text: 'Edit Profile',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomLinerButton(
                            gradient: const LinearGradient(
                              begin: Alignment(-1, 0),
                              end:Alignment(1.00, 0.00) ,
                              colors: [Color(0xFFF45741), Color(0xFFF7817A)],
                            ),
                            onPressed: () {
                              context
                                  .read<ProfileCubit>()
                                  .getMyFavouriteEvents();
                              navigate(
                                  context: context,
                                  route: Routes.favoritesScreen);
                            },
                            text: 'Favorites',
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
