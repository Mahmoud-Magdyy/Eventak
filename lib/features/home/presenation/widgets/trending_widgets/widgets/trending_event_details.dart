import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_nav_bar_details_screen.dart';
import 'package:eventak/features/home/data/model/trend_event_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/brought_to_you.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/catregory_item.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/description.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/include_in_the_price.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/location_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TrendingEeventDetails extends StatelessWidget {
  TrendingEeventDetails({super.key, this.trendingEeventModel});
  TrendingEeventModel? trendingEeventModel;
  @override
  Widget build(BuildContext context) {
    if (trendingEeventModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ImageOfEventDetails(
                          image:
                              trendingEeventModel!.posterPicture['secure_url'],
                          // image: trendingEeventModel!.imageEvent,
                        ),
                        const Positioned(
                          top: 30,
                          left: 25,
                          right: 25,
                          child: BackIconAndFav(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 220,
                                child: FittedBox(
                                  child: Text(
                                    maxLines: 2,
                                    trendingEeventModel!.nameOfEvent,
                                    style: AppStyles.styleSemiBold24(context)
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              CategoryItemDetails(
                                icon: Icons.track_changes,
                                nameOfIconCateogry:
                                    trendingEeventModel!.category,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          LocationAndTimeAndDateNewEventDetails(
                            location: trendingEeventModel!.location['street'] +
                                ', ' +
                                trendingEeventModel!.location['nameOfLocation'],
                            dateMonth: trendingEeventModel!.date,
                            dateTime:
                                '${trendingEeventModel!.startTime} - ${trendingEeventModel!.endTime}',
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Description(
                              description: trendingEeventModel!.description),
                              const SizedBox(
                            height: 24,
                          ),
                           BlocBuilder<HomeCubit, HomeState>(
                             builder: (context, state) {
                               return BroughtToYou(name:trendingEeventModel!.broughtToYouBy,
                                                      url:trendingEeventModel!.creatorPicture['secure_url'] ,
                                                      );
                             },
                           ),
                          const SizedBox(
                            height: 16,
                          ),
                          IncludeThePrice(
                            includeInPrice:
                                trendingEeventModel!.whatIsIncludedInPrice,
                          ),
                          // const Divider()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
          const CustomNavBarDetailsScreen(),
        ]),
      ));
    }
  }
}
