import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:flutter/material.dart';

class ItemListSearch extends StatelessWidget {
  const ItemListSearch({
    super.key,
    required this.filteredEvents,
    required this.title,
    required this.subtitle,
  });

  final List<AllEventModel> filteredEvents;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 110,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      child: ListTile(
        titleTextStyle: AppStyles.styleRegular16(context)
            .copyWith(fontWeight: FontWeight.w700,),
        subtitleTextStyle: AppStyles.styleMedium10(context),
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(vertical: 4),
        leading: Container(
          width: 88,
          height: 250,
          decoration: ShapeDecoration(
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage(
                Assets.imagesImageee,
              ),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

// class CustomListTileSearchEvent extends StatelessWidget {
//   const CustomListTileSearchEvent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       // height: 110,
//       padding: const EdgeInsets.all(8),
//       margin: const EdgeInsets.all(8),
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//       ),
//       child: Row(
//         children: [
//           Image.asset(
//             Assets.imagesImageee,
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Column(
//             children: [
//               Text('data'),
//               Text('data'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
