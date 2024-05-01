import 'dart:io';

import 'package:eventak/core/utils/app_images.dart';
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
                const Text('Profile'),
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
                const Text('Mahmoud Magdy'),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('03'),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Events Create'),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('03'),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Events Create'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
