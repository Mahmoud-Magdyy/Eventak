import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/brought_to_you.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/catregory_item.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/description.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/location_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewEeventDetails extends StatelessWidget {
  const NewEeventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateEventCubit, CreateEventState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const Stack(
                  children: [
                    ImageOfEventDetails(),
                    Positioned(
                      top: 30,
                      left: 25,
                      right: 25,
                      child: BackIconAndFav(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tech Summit 2024',
                            style: AppStyles.styleSemiBold24(context)
                                .copyWith(color: Colors.black),
                          ),
                          const CategoryItemDetails(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const LocationAndTimeAndDateNewEventDetails(),
                      const SizedBox(
                        height: 32,
                      ),
                      const Description(),
                      const BroughtToYou()
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
