import 'package:eventak/features/home/data/model/category_item_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});
  static const items = [
    CategoryItemModel(nameCategory: 'Music', icon: Icons.music_note),
    CategoryItemModel(nameCategory: 'Education', icon: Icons.music_note),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return IntrinsicWidth(
                    child: CategoryItem(
                  categoryItemModel: items[index],
                  onTap: (categoryName) {
                    // context.read<HomeCubit>().onTapCategoryName=categoryName;
                    if (context.read<HomeCubit>().onTapCategoryName ==
                        categoryName) {
                      context.read<HomeCubit>().onTapCategoryName = '';
                    } else {
                      context.read<HomeCubit>().onTapCategoryName =
                          categoryName;
                    }
                    context.read<HomeCubit>().getAllEvents(
                        categoryName:
                            context.read<HomeCubit>().onTapCategoryName);
                  },
                ));
              }),
        );
      },
    );
  }
}
