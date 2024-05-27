import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_section.dart';
import 'package:eventak/features/home/presenation/widgets/custom_app_bar.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_list.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_section.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_section.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 0, right: 8.0),
              child: RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  // Here you can call the method to refresh your data
                  context.read<HomeCubit>().getAllEvents();
                  context.read<HomeCubit>().getTrendigEvents();
                  context.read<MyCreatedEventsCubit>().getMyCreatedEvents();
                  context.read<MyCreatedEventsCubit>().getRequestedMyEvents();

                  
                },
                child: const CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverToBoxAdapter(child: CustomHomeAppBar()),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(child: TrendingEevent()),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(child: CategorySection()),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(child: NewEventSection()),
                    // state is GetAllEventsLoadingState
                    //     ? const SliverToBoxAdapter(
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       )
                    //     : 
                        SliverToBoxAdapter(child: NewEventListView()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
