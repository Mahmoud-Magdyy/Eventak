import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDateEvent extends StatelessWidget {
  const CustomDateEvent({
    super.key, required this.day, required this.month, 
  });
final String day;
final String month;
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
                  text: '$day\n',
                  style:
                      AppStyles.styleSemiBold6(context).copyWith(fontSize: 8),
                ),
                TextSpan(
                    text: month,
                    style: AppStyles.styleSemiBold8(context)
                        .copyWith(fontSize: 6)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
