
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndSubTitleOfEvent extends StatelessWidget {
  const TitleAndSubTitleOfEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Text(
         'Harmony Fest 2024',
         style: AppStyles.styleBold16(context)
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
               'Riverside Park Amphitheater',
               style: AppStyles.styleMedium12(context)
             ),
           ),
          
         ],
       )
     ],
                                  );
  }
}
