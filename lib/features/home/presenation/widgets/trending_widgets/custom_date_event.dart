import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDateEvent extends StatelessWidget {
  const CustomDateEvent({
    super.key, required this.day,
  });
final String day;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(height: 1),
              children: [
                TextSpan(
                  text: day,
                  style:
                      AppStyles.styleSemiBold6(context).copyWith(fontSize: 8),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
