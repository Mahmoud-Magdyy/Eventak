
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class LocationAndTimeAndDateNewEventDetails extends StatelessWidget {
  const LocationAndTimeAndDateNewEventDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CusotmListTileNewEventDetails(
          icon: Icons.location_on_outlined,
          text: 'Grand Convention Center, Cityville',
        ),
        SizedBox(
      height: 16,
    ),
    CusotmListTileNewEventDetails(
      icon: Icons.calendar_month_outlined,
      text: 'Saturday, May 18th, 2024',
    ),SizedBox(
      height: 16,
    ),
    CusotmListTileNewEventDetails(
      icon: Icons.access_time_outlined,
      text: '9:00 AM - 5:00 PM',
    ),
      ],
    );
  }
}
