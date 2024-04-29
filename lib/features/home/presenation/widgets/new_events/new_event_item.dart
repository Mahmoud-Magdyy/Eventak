import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/left_new_event/final_image_and_dec.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/final_dec_of_new_event_right.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/new_event_details_screen.dart';
import 'package:flutter/material.dart';

class NewEeventItem extends StatelessWidget {
  const NewEeventItem({
    super.key,
    required this.newEventModel,
  });
  final NewEventModel newEventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 262,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(newEventModel.imageEvent),
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
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewEeventDetails(
                            newEventModel: newEventModel,
                          )),
                ),
                child: ImageAndDecOfNewEventLeft(
                    dateDay: newEventModel.dateDay,
                    monthDay: newEventModel.monthDay,
                    categoryIcon: newEventModel.categoryIcon,
                    imageEvent: newEventModel.imageEvent,
                    textOfNewEvent: newEventModel.textOfNewEvent,
                    nameOfCategoryEvent: newEventModel.nameOfCategoryEvent),
              ),
              const SizedBox(
                width: 8,
              ),
              DecOfNewEventRight(
                nameOfEvent: newEventModel.nameOfEvent,
                titleDateOfTicket: newEventModel.titleDateOfTicket,
                subTitleDateOfTicket: newEventModel.subTitleDateOfTicket,
                titleLocationOfEvent: newEventModel.titleLocationOfEvent,
                subTitleLocationOfEvent: newEventModel.subTitleLocationOfEvent,
                titlePriceOfEvent: newEventModel.titlePriceOfEvent,
                subTitlePriceOfEvent: newEventModel.subTitlePriceOfEvent,
              )
            ],
          )
        ],
      ),
    );
  }
}
