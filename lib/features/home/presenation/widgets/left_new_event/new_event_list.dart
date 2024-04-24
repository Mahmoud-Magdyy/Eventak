import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/new_event_item.dart';
import 'package:flutter/material.dart';

class NewEventListView extends StatelessWidget {
  const NewEventListView({
    super.key,
  });
  static const items = [
    NewEventModel(
      nameOfCategoryEvent: 'language',
      dateDay: '20',
      monthDay: 'AUG',
      categoryIcon: Icons.translate_outlined,
      imageEvent: Assets.imagesBackgroundContainer,
      textOfNewEvent:
          'Join us for a rejuvenating day at the Wellness Retreat: Mind, Body, Soul. Escape the hustle and bustle of daily life and immerse yourself in a journey of self-care, relaxation, and holistic well-being.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 262,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return NewEeventItem(
              newEventModel: items[index],
            );
          }),
    );
  }
}
