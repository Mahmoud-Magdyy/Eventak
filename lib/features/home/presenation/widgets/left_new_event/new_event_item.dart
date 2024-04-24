import 'package:eventak/features/home/data/model/new_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/final_image_and_dec.dart';
import 'package:flutter/material.dart';

class NewEeventItem extends StatelessWidget {
  const NewEeventItem(
      {super.key, required this.newEventModel,
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
              ImageAndDecOfNewEvent(newEventModel: newEventModel),
              
            ],
          )
        ],
      ),
    );
  }
}

