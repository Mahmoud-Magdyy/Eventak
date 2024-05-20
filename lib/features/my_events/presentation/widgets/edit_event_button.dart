import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomEditEventButton extends StatelessWidget {
  const CustomEditEventButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // width: 80,
        // height: 28,
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          color: const Color(0xFFDEE9F5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
        ),
        child:  Text('Edit Event',style: AppStyles.styleMedium12(context).copyWith(color: const Color(0xFF18388F)),),
      ),
    );
  }
}