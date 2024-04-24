import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageAndDateOfEvent extends StatelessWidget {
  const ImageAndDateOfEvent({
    super.key, required this.dateOfNewEvent, required this.translateIconInNewEventImage, required this.imagesBackgroundContainer,
  });
final Widget dateOfNewEvent;
final Widget translateIconInNewEventImage;
final String imagesBackgroundContainer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176,
      height: 150,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Stack(children: [
          Container(
            width: 176,
            height: 150,
            decoration:  ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imagesBackgroundContainer),
                fit: BoxFit.fill,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
          ),
          //  Positioned(
          //   child: dateOfNewEvent,
          // ),
           Positioned(
              bottom: 0, right: 0, child: translateIconInNewEventImage)
        ]),
      ),
    );
  }
}
