
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSettingContainer extends StatelessWidget {
  const CustomSettingContainer({
    super.key, required this.title, required this.subTitle,
  });
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title,style: AppStyles.styleMedium14(context).copyWith(color: const Color(0xFF8D8C92),),),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: Colors.black),
              subTitle),
              
        ),
        const SizedBox(height: 24,),
      ],
    );
  }
}
