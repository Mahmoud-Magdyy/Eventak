import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/dropdown_category.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/name_of_event.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/district.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/name_of_location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/street.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/description_form.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/face_recognation.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/what_is_include.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_event_button.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_poster_event.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_price.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_time_and_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventScreen extends StatelessWidget {
  const EditEventScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Event',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EditEventCubit, EditEventState>(
          listener: (context, state) {},
          builder: (context, state) {
            final editCubit = BlocProvider.of<EditEventCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 26,
                      ),
                      const EditPosterOfEvent(),
                      const SizedBox(
                        height: 26,
                      ),
                      NameOfEvent(
                        nameController: editCubit.editNameOfEventController,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      EditDateAndTime(
                        editEventCubit: editCubit,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      CategoryDrowpDown(
                        items: editCubit.items,
                        onChanged: (value) {
                          editCubit.dropDownValue = value;
                          editCubit.category = value;
                        },
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const EditPriceOfTheTicket(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      DescriptionFormField(
                        descriptionController:
                            editCubit.editDescriptionOfEventController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      WhatsIsIncludeFormField(
                        whatIsIncludedInPriceController:
                            editCubit.editIncludedInPriceController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const FaceRecognition(),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                   Column(
                    children: [
                      NameOfLocation(nameOfLocationController: editCubit.editNameOfEventController,),
                      const SizedBox(
                        height: 24,
                      ),
                       Street(streetController: editCubit.editStreetController,),
                      const SizedBox(
                        height: 24,
                      ),
                       District(districtController: editCubit.editDistrictController,),
                      const SizedBox(
                        height: 24,
                      ),

                    ],
                  ),
                  CustomElevetedButton(onPressed: (){}, text: 'Save')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
