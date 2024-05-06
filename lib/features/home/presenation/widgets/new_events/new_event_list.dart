import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewEventListView extends StatelessWidget {
  const NewEventListView({
    super.key,
  });
  // static const items = [
  //   NewEventModel(
  //     nameOfEvent: 'Tech Summit 2024',
  //     titleDateOfTicket: 'Monday, February 27th',
  //     subTitleDateOfTicket: '7:00 AM - 3:00 PM',
  //     titleLocationOfEvent: 'Masr l Gedida,',
  //     subTitleLocationOfEvent: 'Cairo',
  //     titlePriceOfEvent: '5 In Advance',
  //     subTitlePriceOfEvent: '15 In Advance',
  //     dateDay: '20',
  //     nameOfCategoryEvent: 'Music',
  //     monthDay: 'MAR',
  //     categoryIcon: Icons.music_note_outlined,
  //     imageEvent: Assets.imagesBackgroundContainer,
  //     textOfNewEvent:
  //         'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
  //   ),
  //   NewEventModel(
  //     nameOfEvent: 'Tech Summit 2024',
  //     titleDateOfTicket: 'Saturday, August 20th',
  //     subTitleDateOfTicket: '9:00 AM - 5:00 PM',
  //     titleLocationOfEvent: 'Grand Convention Center,',
  //     subTitleLocationOfEvent: 'Cityville',
  //     titlePriceOfEvent: '5 In Advance',
  //     subTitlePriceOfEvent: '5 In Advance',
  //     dateDay: '16',
  //     nameOfCategoryEvent: 'language',
  //     monthDay: 'AUG',
  //     categoryIcon: Icons.translate,
  //     imageEvent: Assets.imagesBackgroundContainer,
  //     textOfNewEvent:
  //         'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
  //   ),
  //   NewEventModel(
  //     nameOfEvent: 'Tech Summit 2024',
  //     titleDateOfTicket: 'Saturday, August 20th',
  //     subTitleDateOfTicket: '9:00 AM - 5:00 PM',
  //     titleLocationOfEvent: 'Grand Convention Center,',
  //     subTitleLocationOfEvent: 'Cityville',
  //     titlePriceOfEvent: '5 In Advance',
  //     subTitlePriceOfEvent: '5 In Advance',
  //     dateDay: '16',
  //     nameOfCategoryEvent: 'language',
  //     monthDay: 'AUG',
  //     categoryIcon: Icons.translate,
  //     imageEvent: Assets.imagesBackgroundContainer,
  //     textOfNewEvent:
  //         'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
  //   ),
  //   NewEventModel(
  //     nameOfEvent: 'Tech Summit 2024',
  //     titleDateOfTicket: 'Saturday, August 20th',
  //     subTitleDateOfTicket: '9:00 AM - 5:00 PM',
  //     titleLocationOfEvent: 'Grand Convention Center,',
  //     subTitleLocationOfEvent: 'Cityville',
  //     titlePriceOfEvent: '5 In Advance',
  //     subTitlePriceOfEvent: '5 In Advance',
  //     dateDay: '16',
  //     nameOfCategoryEvent: 'language',
  //     monthDay: 'AUG',
  //     categoryIcon: Icons.translate,
  //     imageEvent: Assets.imagesBackgroundContainer,
  //     textOfNewEvent:
  //         'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
  //   ),
  //   NewEventModel(
  //     nameOfEvent: '7okaaa',
  //     titleDateOfTicket: 'Saturday, August 20th',
  //     subTitleDateOfTicket: '9:00 AM - 5:00 PM',
  //     titleLocationOfEvent: 'Grand Convention Center,',
  //     subTitleLocationOfEvent: 'Cityville',
  //     titlePriceOfEvent: '5 In Advance',
  //     subTitlePriceOfEvent: '5 In Advance',
  //     dateDay: '16',
  //     nameOfCategoryEvent: 'language',
  //     monthDay: 'AUG',
  //     categoryIcon: Icons.translate,
  //     imageEvent: Assets.imagesBackgroundContainer,
  //     textOfNewEvent:
  //         'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology.',
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Events'),
              )
            : SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: context.read<HomeCubit>().events.length,
                  itemBuilder: (context, index) {
                    return NewEeventItem(
                      allEventModel: context.read<HomeCubit>().events[index],
                    );
                  }),
            );
      },
    );
  }
}
