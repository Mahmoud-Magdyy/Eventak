import 'dart:io';

import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/widgets/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CustomFileImage extends StatelessWidget {
  const CustomFileImage(
      {super.key, this.image});
  final XFile? image;
  
  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
          radius: 75,
          backgroundImage: 
           FileImage(
              File(image!.path),
              
            ),
        )
        : const CustomImages(
            imgPath: Assets.imagesCircleAvatarImage,
            height: 150,
          );
  }
}
