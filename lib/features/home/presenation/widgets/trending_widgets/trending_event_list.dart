
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TrendingEventListView extends StatelessWidget {
  const TrendingEventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetTrendingEventsLoadingState) {
          // Display shimmer effect during loading
          return SizedBox(
            height: 94,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Use a placeholder count during loading
              itemBuilder: (context, index) {
                return IntrinsicWidth(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),),
                      width: 160.0, // Adjust the width as needed
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      
                    ),
                  ),
                );
              },
            ),
          );
        } else if (context.read<HomeCubit>().trendingEvents.isEmpty) {
          return const Center(
            child: Text('No Events'),
          );
        } else {
          return SizedBox(
            height: 94,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<HomeCubit>().trendingEvents.length,
              itemBuilder: (context, index) {
                return IntrinsicWidth(
                  child: CustomTrendingEventItem(
                    trendingEeventModel: 
                     context.read<HomeCubit>().trendingEvents[index],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
