import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/left_new_event/final_image_and_dec.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/final_dec_of_new_event_right.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/new_event_details_screen.dart';
import 'package:flutter/material.dart';

class NewEeventItem extends StatelessWidget {
  const NewEeventItem({
    super.key,
    required this.allEventModel,
    // required this.newEventModel,
  });
  // final NewEventModel newEventModel;
  final AllEventModel allEventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 262,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(
            Assets.imagesBackgroundContainer,
            // newEventModel.imageEvent
          ),
          fit: BoxFit.fill,
          opacity: 0.10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  NewEeventDetails(
                         allEventModel: allEventModel,
                          )),
                ),
                child: ImageAndDecOfNewEventLeft(
                    dateDay: allEventModel.date,
                    monthDay: allEventModel.date,
                    // categoryIcon: newEventModel.categoryIcon,
                    // imageEvent: newEventModel.imageEvent,
                    textOfNewEvent: allEventModel.description,
                    nameOfCategoryEvent: allEventModel.category),
              ),
              // const SizedBox(
              //   width: 8,
              // ),
              DecOfNewEventRight(
                nameOfEvent: allEventModel.nameOfEvent,
                titleDateOfTicket: allEventModel.date,
                startTimeOfEvent: allEventModel.startTime,
                endTimeOfEvent: allEventModel.endTime,
                titleLocationOfEvent: allEventModel.location['street'],
                subTitleLocationOfEvent: allEventModel.location['nameOfLocation'],
                titlePriceOfEvent: allEventModel.priceInAdvance,
                subTitlePriceOfEvent: allEventModel.priceAtTheDoor,
              )
            ],
          )
        ],
      ),
    );
  }
}
