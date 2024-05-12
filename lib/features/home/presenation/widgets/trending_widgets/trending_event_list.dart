import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingEeventListView extends StatelessWidget {
  const TrendingEeventListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return context.read<HomeCubit>().trendingEvents.isEmpty
            ? const Center(
                child: Text('No Events'),
              )
            :
        SizedBox(
          height: 94,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<HomeCubit>().trendingEvents.length,
              itemBuilder: (context, index) {
                return IntrinsicWidth(
                    child: CustomTrendingEventItem(
                        trendingEeventModel: context.read<HomeCubit>().trendingEvents[index]));
              }),
        );
      },
    );
  }
}
