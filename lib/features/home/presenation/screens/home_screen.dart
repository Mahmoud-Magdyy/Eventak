import 'package:eventak/features/home/presenation/widgets/category_widgets/category_section.dart';
import 'package:eventak/features/home/presenation/widgets/custom_app_bar.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_list.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_section.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, top: 0, right: 8.0),
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              NewEventListView()
            ],
          ),
        ),
      ),
    );
  }
}
