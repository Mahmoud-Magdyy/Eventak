import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/widgets/category_widgets/category_section.dart';
import 'package:eventak/features/home/presenation/widgets/custom_app_bar.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_list.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_section.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return  SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 0, right: 8.0),
              child: CustomScrollView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  const SliverToBoxAdapter(child: CustomHomeAppBar()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24,
                    ),
                  ),
                  const SliverToBoxAdapter(child: TrendingEevent()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24,
                    ),
                  ),
                  const SliverToBoxAdapter(child: CategorySection()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24,
                    ),
                  ),
                  const SliverToBoxAdapter(child: NewEventSection()),
                  state is GetAllEventsLoadingState
                      ? const SliverToBoxAdapter(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : 
                      const SliverToBoxAdapter(child: NewEventListView())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
