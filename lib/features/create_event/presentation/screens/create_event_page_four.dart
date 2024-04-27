import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/orgnaizer.dart';
import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/profile_picture_container.dart';
import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/short_description.dart';
import 'package:flutter/material.dart';

class CreateEventPageFour extends StatelessWidget {
  const CreateEventPageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 24,
        ),
       Organizer(),
        SizedBox(
          height: 24,
        ),
        ProfilePicture(),
        SizedBox(
          height: 24,
        ),
        ShortDescription(),
        SizedBox(
          height: 24,
        ),
        
      ],
    );
  }
}