
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class LocationAndTimeAndDateNewEventDetails extends StatelessWidget {
  const LocationAndTimeAndDateNewEventDetails({
    super.key, required this.location, required this.dateMonth, required this.dateTime,
  });
final String location; 
final String dateMonth; 
final String dateTime; 
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CusotmListTileNewEventDetails(
          icon: Icons.location_on_outlined,
          text: location,
        ),
        const SizedBox(
      height: 16,
    ),
    CusotmListTileNewEventDetails(
      icon: Icons.calendar_month_outlined,
      text: dateMonth,
    ),const SizedBox(
      height: 16,
    ),
    CusotmListTileNewEventDetails(
      icon: Icons.access_time_outlined,
      text: dateTime,
    ),
      ],
    );
  }
}
