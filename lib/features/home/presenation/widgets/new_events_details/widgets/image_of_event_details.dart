import 'package:eventak/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ImageOfEventDetails extends StatelessWidget {
  const ImageOfEventDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child:
          Image.asset(Assets.imagesImageee, fit: BoxFit.fill),
    );
  }
}
