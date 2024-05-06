import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTileTitmeOfEvent extends StatelessWidget {
  const CustomListTileTitmeOfEvent({
    super.key,
    required this.textTitle, required this.startTime, required this.endTime,
  });
  final String textTitle;
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.event,
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
            Row(
              children: [
                Text(startTime ,
                    style: AppStyles.styleMedium8(context).copyWith(fontSize: 8)),
                     Text(' - ',style: AppStyles.styleMedium6(context),),
                Text(endTime ,
                    style: AppStyles.styleMedium8(context).copyWith(fontSize: 8)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
