import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTilePriceOfEvent extends StatelessWidget {
  const CustomListTilePriceOfEvent({
    super.key,
    required this.textTitle,
    this.textSubTitle,
  });
  final String textTitle;
  final String? textSubTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.attach_money,
          color: AppColors.white,
          size: 20,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textTitle,
                style: AppStyles.styleMedium8(context).copyWith(fontSize: 8)),
            Text(textSubTitle ?? '',
                style: AppStyles.styleMedium8(context).copyWith(fontSize: 8)),
          ],
        )
      ],
    );
  }
}
