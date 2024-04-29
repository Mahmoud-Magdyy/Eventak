import 'package:flutter/material.dart';

class ImageOfEventDetails extends StatelessWidget {
  const ImageOfEventDetails({
    super.key, required this.image,
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child:
          Image.asset(image, fit: BoxFit.fill),
    );
  }
}
