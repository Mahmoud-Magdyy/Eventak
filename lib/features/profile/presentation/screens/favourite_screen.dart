import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/profile/presentation/widgets/list_favourites.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body:const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FavouriteList()
            ],
          ),
        ),
      ) ,
    );
  }
}
