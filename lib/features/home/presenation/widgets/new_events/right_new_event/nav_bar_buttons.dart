import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/custom_button.dart';
import 'package:flutter/material.dart';

class NavBarButtonsNewEvent extends StatelessWidget {
  const NavBarButtonsNewEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNewEventButton(
          icon: Icons.airplane_ticket_outlined,
        ),
        SizedBox(
          width: 4,
        ),
        CustomNewEventButton(
          icon: Icons.airplane_ticket_outlined,
        ),
        SizedBox(
          width: 4,
        ),
        CustomNewEventButton(
          icon: Icons.airplane_ticket_outlined,
        ),
        SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
