import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/descraption.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/description_form.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/face_recognation.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/optional_description.dart';
import 'package:flutter/material.dart';

class CreateEventPageTwo extends StatelessWidget {
  const CreateEventPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          DescriptionText(),
          SizedBox(
            height: 24,
          ),
          DescriptionFormField(),
          SizedBox(
            height: 24,
          ),
          OptionalDescriptionFormField(),
          SizedBox(
            height: 24,
          ),
          FaceRecognition(),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

