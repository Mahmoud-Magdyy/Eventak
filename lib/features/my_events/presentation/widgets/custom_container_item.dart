
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:flutter/material.dart';

class CustomMyCreatedEventItemList extends StatelessWidget {
  const CustomMyCreatedEventItemList({
    super.key, required this.myCreatedEventModel,
  });
final MyCreatedEventModel myCreatedEventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // width: 329,
      // height: 160,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomImageOfEvent(image: myCreatedEventModel.posterPicture['secure_url'],),
             const  SizedBox(
                width: 16,
              ),
               TitleAndSubTitleOfEvent(nameOfEvent:myCreatedEventModel.nameOfEvent ,location:myCreatedEventModel.location['street'] ,)
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(child: CustomElevetedButton(onPressed: (){}, text: 'Delete'),),
              const SizedBox(width: 16,),
              Expanded(child: CustomElevetedButton(onPressed: (){}, text: 'Edit',),),
            ],
          )
        ],
      ),
    );
  }
}
