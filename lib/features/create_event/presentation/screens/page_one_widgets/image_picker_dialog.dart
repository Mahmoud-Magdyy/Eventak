
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ImagePackerDialog extends StatelessWidget {
  const ImagePackerDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });
final VoidCallback cameraOnTap;
final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //camera
          ListTile(
            leading:  const Icon(
              Icons.camera_alt,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'camera',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                      color: AppColors.primaryColor),
            ),
            onTap: cameraOnTap,
          ),
          ListTile(
            leading:  const Icon(
              Icons.photo,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'gallery',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                      color: AppColors.primaryColor),
            ),
            onTap: galleryOnTap,
          ),
          
        ],
      ),
    );
  }
}
