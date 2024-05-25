import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/image_picker_dialog.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomEditImage extends StatelessWidget {
  const CustomEditImage({
    super.key,
    required this.profileCubit,
  });

  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        width: 130,
        height: 130,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: profileCubit.profileImage == null
                ? CachedNetworkImageProvider( profileCubit.profileModel!.profilePic['secure_url'],)
                : FileImage(
                        File(profileCubit.profileImage!.path))
                    as ImageProvider<Object>,
            fit: BoxFit.cover,
          ),
          shape: const OvalBorder(),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ImagePackerDialog(
                    cameraOnTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.camera).then(
                          (value) => profileCubit
                              .editProfileImage(value));
                    },
                    galleryOnTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery).then(
                          (value) => profileCubit
                              .editProfileImage(value));
                    },
                  );
                });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: const ShapeDecoration(
                color: AppColors.primaryColor,
                shape: OvalBorder()),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
      )
    ]);
  }
}
