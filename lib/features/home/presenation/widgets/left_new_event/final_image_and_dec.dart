import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/date_of_event_in_image.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/text_of_event.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/translate_icon_and_text.dart';
import 'package:flutter/material.dart';

class ImageAndDecOfNewEvent extends StatelessWidget {
  const ImageAndDecOfNewEvent({
    super.key,
    required this.newEventModel,
  });

  final NewEventModel newEventModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Image.asset(newEventModel.imageEvent),
          Positioned(
            child: DateOfNewEvent(
              dayDate: newEventModel.dateDay,
              monthDate: newEventModel.monthDay,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: TranslateIconInNewEventImage(categoryIcon: newEventModel.categoryIcon,
              nameOfCategoryEvent: newEventModel.nameOfCategoryEvent,))
        ]),
        Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: TextOfEvent(textOfNewEvent: newEventModel.textOfNewEvent),
        )
      ],
    );
  }
}
