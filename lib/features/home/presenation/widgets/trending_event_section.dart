import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_strings.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/data/model/trend_event_model.dart';
import 'package:eventak/features/home/presenation/widgets/trending_event_item.dart';
import 'package:flutter/material.dart';

class TrendingEevent extends StatelessWidget {
  const TrendingEevent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.trendingEvents.tr(context),
          style: AppStyles.styleBold16(context).copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        const TrendingEeventListView(),
      ],
    );
  }
}

class TrendingEeventListView extends StatelessWidget {
  const TrendingEeventListView({super.key});
  static const items = [
    TrendingEeventModel(
      image: AssetImage(Assets.imagesImggg),
      day: '20',
      month: 'AUG',
      nameOfEvent: 'nameOfEvent',
      location: 'location',
    ),
    TrendingEeventModel(
      image: AssetImage(Assets.imagesImggg),
      day: '30',
      month: 'FEB',
      nameOfEvent: 'nameOfEvent',
      location: 'location',
    ),
    TrendingEeventModel(
      image: AssetImage(Assets.imagesImggg),
      day: '30',
      month: 'FEB',
      nameOfEvent: 'nameOfEvent',
      location: 'location',
    ),
    TrendingEeventModel(
      image: AssetImage(Assets.imagesImggg),
      day: '30',
      month: 'FEB',
      nameOfEvent: 'nameOfEvent',
      location: 'location',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context,index){
          return IntrinsicWidth(child: CustomTrendingEventItem(trendingEeventModel: items[index]));
        }),
    );
  }
}
