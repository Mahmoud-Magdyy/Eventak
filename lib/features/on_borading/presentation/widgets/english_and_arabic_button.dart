import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EnglishAndArabicButton extends StatelessWidget {
  const EnglishAndArabicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.80, color: AppColors.deepBlue),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {},
              child: Text(
                'En',
                style: AppStyles.styleRegular14(context)
                    .copyWith(fontSize: 15),
              )),
          GestureDetector(
              onTap: () {},
              child: Text('ع',
                  style: AppStyles.styleRegular14(context)
                      .copyWith(fontSize: 16))),
        ],
      ),
    );
  }
}
