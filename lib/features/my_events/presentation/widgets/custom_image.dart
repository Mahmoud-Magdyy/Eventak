
import 'package:flutter/material.dart';

class CustomImageOfEvent extends StatelessWidget {
  const CustomImageOfEvent({
    super.key, required this.image,
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: ShapeDecoration(
        image:  DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
