import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TextLocationEventTrendigItem extends StatelessWidget {
  const TextLocationEventTrendigItem({
    super.key, required this.nameOfEvent, required this.locationOfEvent,
  });
final String nameOfEvent;
final String locationOfEvent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 103,
      height: 20,
      child: Stack(
        children: [
        Positioned(
          left: 0,
          bottom: 10,
          child: Text(
            nameOfEvent,
            style: AppStyles.styleSemiBold8(context)
                .copyWith(fontSize: 8, color: Colors.white),
          ),
        ),
        Positioned(
          left: 12,
          top: 10,
          child: SizedBox(
            width: 81,
            height: 10,
            child: Text(locationOfEvent,
                style: AppStyles.styleMedium6(context)
                    .copyWith(fontSize: 6)),
          ),
        ),
        const Positioned(
          left: 0,
          top: 10,
          child: Icon(Icons.location_on_outlined, size: 10,color: Colors.white,),
        ),
      ]),
    );
  }
}
