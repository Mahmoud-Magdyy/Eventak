import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/district.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/name_of_location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/street.dart';
import 'package:flutter/material.dart';

class CreateEventPageThree extends StatelessWidget {
  const CreateEventPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
         Location(),
          SizedBox(
            height: 24,
          ),
          NameOfLocation(),
          SizedBox(
            height: 24,
          ),
          Street(),
          SizedBox(
            height: 24,
          ),
          District(),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}