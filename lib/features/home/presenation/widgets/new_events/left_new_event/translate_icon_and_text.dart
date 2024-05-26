import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TranslateIconInNewEventImage extends StatelessWidget {
  const TranslateIconInNewEventImage({
    super.key, required this.nameOfCategoryEvent, required this.categoryIcon
  });
final String nameOfCategoryEvent;
final IconData categoryIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 70,
      height: 20,
      padding: const EdgeInsets.all(4),
      decoration: const ShapeDecoration(
        color: Color(0xFF2E66AB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  Icon(
          //   categoryIcon,
          //   size: 8,
          //   color: Colors.white,
          // ),
          // const SizedBox(width: 8,),
          SizedBox(
            height: 8,
            child: Text(nameOfCategoryEvent,
                textAlign: TextAlign.center,
                style: AppStyles.styleSemiBold6(context)
                    .copyWith(color: Colors.white, fontSize: 6)),
          ),
        ],
      ),
    );
  }
}
