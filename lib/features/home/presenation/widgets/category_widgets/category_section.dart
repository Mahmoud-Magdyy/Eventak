import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_list.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.categories.tr(context),
          style: AppStyles.styleBold16(context).copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        const CategoryItemListView(),
      ],
    );
  }
}

