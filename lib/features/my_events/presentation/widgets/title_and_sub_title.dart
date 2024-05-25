
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndSubTitleOfEvent extends StatelessWidget {
  const TitleAndSubTitleOfEvent({
    super.key, required this.nameOfEvent, required this.location,
  });
final String nameOfEvent;
final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       SizedBox(
        // width: 209,
         child: Text(
           nameOfEvent,
           maxLines: 1,
                    overflow: TextOverflow.ellipsis,
           style: AppStyles.styleBold16(context)
         ),
       ),
       const SizedBox(
         height: 24,
       ),
        Row(
         children: [
           const Icon(Icons.location_on_outlined,size: 20,),
           const SizedBox(width: 6,),
           SizedBox(
             child: Text(
               location,overflow: TextOverflow.ellipsis,
               style: AppStyles.styleMedium12(context)
             ),
           ),
          
         ],
       )
     ],
                                  );
  }
}
