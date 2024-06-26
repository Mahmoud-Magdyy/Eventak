import 'dart:io';

import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.registerCubit,
  });

  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        width: 96,
        height: 96,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: registerCubit.profileImage == null
                ? const AssetImage(
                    Assets.imagesBluePersonal)
                : FileImage(
                        File(registerCubit.profileImage!.path))
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
                          (value) => registerCubit
                              .changeRegisterProfileImage(value));
                    },
                    galleryOnTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery).then(
                          (value) => registerCubit
                              .changeRegisterProfileImage(value));
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
