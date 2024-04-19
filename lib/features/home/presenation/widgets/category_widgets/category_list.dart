import 'package:eventak/features/home/data/model/category_item_model.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});
  static const items = [
    CategoryItemModel(nameCategory: 'Music', icon: Icons.music_note),
    CategoryItemModel(nameCategory: 'Music', icon: Icons.music_note),
    CategoryItemModel(nameCategory: 'Conferences', icon: Icons.ac_unit_sharp),
    CategoryItemModel(nameCategory: 'Music', icon: Icons.music_note),
    CategoryItemModel(nameCategory: 'Conferences', icon: Icons.ac_unit_sharp),
    
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context,index){
          return IntrinsicWidth(child: CategoryItem(categoryItemModel: items[index]));
        }),
    );
  }
}
