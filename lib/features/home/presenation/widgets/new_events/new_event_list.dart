import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_item.dart';
import 'package:flutter/material.dart';

class NewEventListView extends StatelessWidget {
  const NewEventListView({
    super.key,
  });
  static const items = [
    NewEventModel(
      nameOfEvent: 'Tech Summit 2024',
      titleDateOfTicket: 'Saturday, August 20th',
      subTitleDateOfTicket: '9:00 AM - 5:00 PM',
      titleLocationOfEvent: 'Grand Convention Center,',
      subTitleLocationOfEvent: 'Cityville',
      titlePriceOfEvent: '5 In Advance',
      subTitlePriceOfEvent: '5 In Advance',
      dateDay: '16',
      nameOfCategoryEvent: 'language',
      monthDay: 'AUG',
      categoryIcon: Icons.translate,
      imageEvent: Assets.imagesBackgroundContainer,
      textOfNewEvent:
          'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
    ),
    NewEventModel(
      nameOfEvent: 'Tech Summit 2024',
      titleDateOfTicket: 'Saturday, August 20th',
      subTitleDateOfTicket: '9:00 AM - 5:00 PM',
      titleLocationOfEvent: 'Grand Convention Center,',
      subTitleLocationOfEvent: 'Cityville',
      titlePriceOfEvent: '5 In Advance',
      subTitlePriceOfEvent: '5 In Advance',
      dateDay: '16',
      nameOfCategoryEvent: 'language',
      monthDay: 'AUG',
      categoryIcon: Icons.translate,
      imageEvent: Assets.imagesBackgroundContainer,
      textOfNewEvent:
          'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
    ),
    NewEventModel(
      nameOfEvent: 'Tech Summit 2024',
      titleDateOfTicket: 'Saturday, August 20th',
      subTitleDateOfTicket: '9:00 AM - 5:00 PM',
      titleLocationOfEvent: 'Grand Convention Center,',
      subTitleLocationOfEvent: 'Cityville',
      titlePriceOfEvent: '5 In Advance',
      subTitlePriceOfEvent: '5 In Advance',
      dateDay: '16',
      nameOfCategoryEvent: 'language',
      monthDay: 'AUG',
      categoryIcon: Icons.translate,
      imageEvent: Assets.imagesBackgroundContainer,
      textOfNewEvent:
          'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
    ),
    NewEventModel(
      nameOfEvent: 'Tech Summit 2024',
      titleDateOfTicket: 'Saturday, August 20th',
      subTitleDateOfTicket: '9:00 AM - 5:00 PM',
      titleLocationOfEvent: 'Grand Convention Center,',
      subTitleLocationOfEvent: 'Cityville',
      titlePriceOfEvent: '5 In Advance',
      subTitlePriceOfEvent: '5 In Advance',
      dateDay: '16',
      nameOfCategoryEvent: 'language',
      monthDay: 'AUG',
      categoryIcon: Icons.translate,
      imageEvent: Assets.imagesBackgroundContainer,
      textOfNewEvent:
          'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
         scrollDirection: Axis.vertical,
         physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return NewEeventItem(
              newEventModel: items[index],
            );
          }),
    );
  }
}