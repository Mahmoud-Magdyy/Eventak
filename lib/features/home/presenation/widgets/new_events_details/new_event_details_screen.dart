import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/brought_to_you.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/catregory_item.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/description.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/include_in_the_price.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/location_and_time.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewEeventDetails extends StatelessWidget {
  NewEeventDetails({super.key, this.allEventModel});
  AllEventModel? allEventModel;
  @override
  Widget build(BuildContext context) {
    if (allEventModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Stack(
                children: [
                  ImageOfEventDetails(
                    image: Assets.imagesOn1,
                    // image: allEventModel!.imageEvent,
                  ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 220,
                          child: FittedBox(
                            child: Text(
                              maxLines: 2,
                              allEventModel!.nameOfEvent,
                              style: AppStyles.styleSemiBold24(context)
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        CategoryItemDetails(
                          icon: Icons.track_changes,
                          nameOfIconCateogry: allEventModel!.category,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LocationAndTimeAndDateNewEventDetails(
                      location: allEventModel!.location['street'] +
                          ', ' +
                          allEventModel!.location['nameOfLocation'],
                      dateMonth: allEventModel!.date,
                      dateTime:
                          '${allEventModel!.startTime} - ${allEventModel!.endTime}',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Description(description: allEventModel!.description),
                    const BroughtToYou(),
                    const SizedBox(
                      height: 24,
                    ),
                    IncludeThePrice(
                      includeInPrice: allEventModel!.whatIsIncludedInPrice,
                    ),
                    const Divider()
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
  }
}
