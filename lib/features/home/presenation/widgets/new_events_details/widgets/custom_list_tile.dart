import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CusotmListTileNewEventDetails extends StatelessWidget {
  const CusotmListTileNewEventDetails({
    super.key, required this.icon, required this.text,
  });
final IconData icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon,color: AppColors.colorCategoryName,size: 22,),
        const SizedBox(
          width: 8,
        ),
        Text(text,style: AppStyles.styleMedium14(context),),
      ],
    );
  }
}
