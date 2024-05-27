import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/descraption.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/description_form.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/what_is_include.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventPageTwo extends StatelessWidget {
  const CreateEventPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: BlocConsumer<CreateEventCubit, CreateEventState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const DescriptionText(),
              const SizedBox(
                height: 24,
              ),
              DescriptionFormField(
                descriptionController: context
                    .read<CreateEventCubit>()
                    .descriptionOfEventController,
              ),
              const SizedBox(
                height: 24,
              ),
               WhatsIsIncludeFormField(whatIsIncludedInPriceController: context.read<CreateEventCubit>().whatIsIncludedInPriceController,),
              const SizedBox(
                height: 24,
              ),
              // const FaceRecognition(),
              // const SizedBox(
              //   height: 24,
              // ),
            ],
          );
        },
      ),
    );
  }
}
