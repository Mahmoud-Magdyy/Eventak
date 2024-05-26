import 'package:eventak/features/home/data/model/category_item_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});
  static const items = [
    CategoryItemModel(nameCategory: 'Music', icon: Icons.music_note_outlined),
    CategoryItemModel(nameCategory: 'Education', icon: Icons.school_outlined),
    CategoryItemModel(nameCategory: 'Sports', icon: Icons.sports_soccer_outlined),
    CategoryItemModel(nameCategory: 'Gaming', icon: Icons.sports_esports_outlined),
    CategoryItemModel(nameCategory: 'Technology', icon: Icons.smartphone_outlined),
    CategoryItemModel(nameCategory: 'Fashion', icon: Icons.checkroom_outlined),
    CategoryItemModel(nameCategory: 'Charity', icon: Icons.volunteer_activism_outlined),
    CategoryItemModel(nameCategory: 'Food & Drink', icon: Icons.fastfood_outlined),
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
                    // if he click on the same category then it will be empty
                    if (context.read<HomeCubit>().onTapCategoryName ==
                        categoryName) {
                      context.read<HomeCubit>().onTapCategoryName = '';
                    } else {
                      context.read<HomeCubit>().onTapCategoryName =
                          categoryName;
                    }
                    // showTwist(messege: categoryName, state: ToastStates.success);
                    //passing name of category to get method to get all events or all events of name category
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
