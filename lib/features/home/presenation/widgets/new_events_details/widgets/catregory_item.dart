import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryItemDetails extends StatelessWidget {
  const CategoryItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 32,
      padding: const EdgeInsets .symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: AppColors.backgroundCategory,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child:  Row(
        children: [
          const Icon(Icons.category_outlined,color: AppColors.colorCategoryName,size: 16,),
          const SizedBox(width: 6,),
          Text('Conference',style: AppStyles.styleSemiBold10(context).copyWith(color: AppColors.colorCategoryName),),
        ],
      ),
    );
  }
}