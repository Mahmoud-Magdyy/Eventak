import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/category_item_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.categoryItemModel, required this.onTap});

  final CategoryItemModel categoryItemModel;
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            onTap(categoryItemModel.nameCategory);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: ShapeDecoration(
              color: context.read<HomeCubit>().isSelected
                  ? AppColors.grey
                  : AppColors.backgroundCategory,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              children: [
                Icon(
                  categoryItemModel.icon,
                  color: AppColors.colorCategoryName,
                  size: 24,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  categoryItemModel.nameCategory,
                  style: AppStyles.styleMediumBlue12(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
