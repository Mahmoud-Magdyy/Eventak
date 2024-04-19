import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/category_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryItemModel});

final CategoryItemModel categoryItemModel;
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
          Icon(categoryItemModel.icon,color: AppColors.colorCategoryName,size: 24,),
          const SizedBox(width: 6,),
          Text(categoryItemModel.nameCategory,style: AppStyles.styleMediumBlue12(context),),
        ],
      ),
    );
  }
}
