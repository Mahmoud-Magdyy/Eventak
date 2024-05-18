
import 'package:eventak/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomImageOfEvent extends StatelessWidget {
  const CustomImageOfEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets
              .images43568355818004288571296517987915713530941523N),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
