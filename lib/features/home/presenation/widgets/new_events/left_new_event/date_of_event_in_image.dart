import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateOfNewEvent extends StatelessWidget {
  const DateOfNewEvent({
    super.key,
    required this.dayDate,
    required this.monthDate,
  });
  final String dayDate;
  final String monthDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          color: AppColors.colorCategoryName,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)))),
      width: 32,
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              dayDate,
              style: AppStyles.styleSemiBold10(context),
            ),
          ),
          Text(
            monthDate,
            style: AppStyles.styleSemiBold10(context),
          ),
        ],
      ),
    );
  }
}
