
import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBarButton extends StatelessWidget {
  const CustomTabBarButton({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 55,
      padding: const EdgeInsets.symmetric(
          horizontal: 50, vertical: 18),
      decoration: ShapeDecoration(
        // color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: AppColors.grey,
            strokeAlign: 1,
          ),
        ),
      ),
      child:  Center(child: Text(text)),
    );
  }
}
