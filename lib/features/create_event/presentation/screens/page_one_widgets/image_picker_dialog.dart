import 'dart:io';

import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';

class ImagePackerDialog extends StatelessWidget {
  const ImagePackerDialog({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
    this.widget,
    this.image, this.send,
  });
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;
  final bool? widget;
  final String? image;
  final String? send;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Dialog(
          // backgroundColor: AppColors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget == true
                  ? Container(
                      width: 96,
                      height: 96,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: context.read<MyCreatedEventsCubit>().faceIdPhoto == null
                              ? const AssetImage(Assets.imagesBluePersonal)
                              : FileImage(
                                      File(context.read<MyCreatedEventsCubit>().faceIdPhoto!.path))
                                  as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                      ),
                    )
                  : const Text(''),
              //camera
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  'camera',
                  style: AppStyles.styleSemiBold24(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
                onTap: cameraOnTap,
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                send??'gallery',
                  style: AppStyles.styleSemiBold24(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
                onTap: galleryOnTap,
              ),
            ],
          ),
        );
      },
    );
  }
}
