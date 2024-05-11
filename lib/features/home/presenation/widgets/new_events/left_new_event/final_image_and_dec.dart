import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/left_new_event/date_of_event_in_image.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/left_new_event/text_of_event.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/left_new_event/translate_icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageAndDecOfNewEventLeft extends StatelessWidget {
  const ImageAndDecOfNewEventLeft({
    super.key,
    required this.dateDay,
    // required this.categoryIcon,
    // required this.imageEvent,
    required this.textOfNewEvent,
    required this.nameOfCategoryEvent,
    required this.urlImage,
  });
  final String dateDay;
  // final IconData categoryIcon;
  // final String imageEvent;
  final String textOfNewEvent;
  final String nameOfCategoryEvent;
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            width: 176,
            height: 158,
            child: Image.network(
              fit: BoxFit.cover,
              urlImage,
              errorBuilder: (context, error, stackTrace) =>
                  const Text('No Image Yet'),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: DateOfNewEvent(
              dayDate: dateDay,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: TranslateIconInNewEventImage(
                categoryIcon: Icons.track_changes,
                //  categoryIcon,
                nameOfCategoryEvent: nameOfCategoryEvent,
              ))
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
          child: TextOfEvent(textOfNewEvent: textOfNewEvent),
        )
      ],
    );
  }
}
