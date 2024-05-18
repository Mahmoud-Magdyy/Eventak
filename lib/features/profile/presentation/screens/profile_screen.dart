import 'dart:io';

import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                const SizedBox(
                  height: 21,
                ),
                 Text('Profile',style: AppStyles.styleBold18(context),),
                const SizedBox(
                  height: 60,
                ),
                BlocConsumer<CreateEventCubit, CreateEventState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final eventCubit =
                        BlocProvider.of<CreateEventCubit>(context);
                    return Container(
                      width: 96,
                      height: 96,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: eventCubit.profileImage == null
                              ? const AssetImage(Assets.imagesCircleAvatarImage)
                              : FileImage(File(eventCubit.profileImage!.path))
                                  as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                 Text(
                  'Mahmoud Magdy',
                  style: AppStyles.styleSemiBold18(context).copyWith(color: Colors.black),
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
                              '03',
                              style: AppStyles.styleBold20(context)
                            ),
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
                             Text(
                              '03',
                              style: AppStyles.styleBold20(context)
                            ),
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
                const SizedBox(height: 40,),
                CustomElevetedButton(onPressed: (){
                  navigate(context: context, route: Routes.editProfileScreen);
                }, text: 'Edit Profile',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
