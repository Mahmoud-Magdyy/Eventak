import 'package:eventak/features/home/data/model/trend_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/custom_date_event.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/text_loaction_event_trending_item.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/widgets/trending_event_details.dart';
import 'package:flutter/material.dart';

class CustomTrendingEventItem extends StatelessWidget {
  const CustomTrendingEventItem({
    super.key,
    required this.trendingEeventModel,
  });

  final TrendingEeventModel trendingEeventModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TrendingEeventDetails(
                  trendingEeventModel: trendingEeventModel,
                )),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 160,
        height: 94,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: Image.network(
              trendingEeventModel.posterPicture['secure_url'],
              errorBuilder: (context, error, stackTrace) =>
                  const Text('No Image Yet'),
            ).image,
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 8,
              top: 8,
              child: CustomDateEvent(
                day: trendingEeventModel.publishAt,
              ),
            ),
            Positioned(
              left: 8,
              top: 66,
              child: TextLocationEventTrendigItem(
                nameOfEvent: trendingEeventModel.nameOfEvent,
                locationOfEvent: trendingEeventModel.location['street'] +
                    ', ' +
                    trendingEeventModel.location['nameOfLocation'],
              ),
            ),
            // const Positioned(
            //   left: 136,
            //   top: 8,
            //   child: CustomFavoriteButtom(),
            // ),
          ],
        ),
      ),
    );
  }
}
