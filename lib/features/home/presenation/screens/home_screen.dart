import 'package:eventak/features/home/presenation/widgets/category_widgets/category_section.dart';
import 'package:eventak/features/home/presenation/widgets/custom_app_bar.dart';
import 'package:eventak/features/home/presenation/widgets/left_new_event/new_event_section.dart';
import 'package:eventak/features/home/presenation/widgets/trending_widgets/trending_event_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              CustomHomeAppBar(),
              SizedBox(
                height: 24,
              ),
              TrendingEevent(),
              SizedBox(
                height: 24,
              ),
              CategorySection(),
              SizedBox(
                height: 24,
              ),
              NewEventSection(),
            ],
          ),
        ),
      ),
    );
  }
}
