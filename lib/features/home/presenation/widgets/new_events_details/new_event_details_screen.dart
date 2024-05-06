import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/brought_to_you.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/catregory_item.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/description.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/location_and_time.dart';
import 'package:flutter/material.dart';

class NewEeventDetails extends StatelessWidget {
  const NewEeventDetails({super.key, this.newEventModel});
  final NewEventModel? newEventModel;
  @override
  Widget build(BuildContext context) {
    if (newEventModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ImageOfEventDetails(
                  image: newEventModel!.imageEvent,
                ),
                const Positioned(
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
                        newEventModel!.nameOfEvent,
                        style: AppStyles.styleSemiBold24(context)
                            .copyWith(color: Colors.black),
                      ),
                      CategoryItemDetails(
                        icon: newEventModel!.categoryIcon,
                        nameOfIconCateogry: newEventModel!.nameOfCategoryEvent,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LocationAndTimeAndDateNewEventDetails(
                    location: newEventModel!.titleLocationOfEvent,
                    dateMonth: newEventModel!.titleDateOfTicket,
                    dateTime: newEventModel!.subTitleDateOfTicket,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Description(description: newEventModel!.textOfNewEvent),
                  const BroughtToYou()
                ],
              ),
            )
          ],
        ),
      ));
    }
  }
}
