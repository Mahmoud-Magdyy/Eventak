import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/dropdown_category.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/name_of_event.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/district.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/name_of_location.dart';
import 'package:eventak/features/create_event/presentation/screens/page_three_widgets/street.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/description_form.dart';
import 'package:eventak/features/create_event/presentation/screens/page_two_widgets/what_is_include.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_poster_event.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_price.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_time_and_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventScreen extends StatelessWidget {
  const EditEventScreen({
    super.key,
  required this.myCreatedEventModel,
  });
  final MyCreatedEventModel myCreatedEventModel;
  @override
  Widget build(BuildContext context) {
    final editCubit = BlocProvider.of<EditEventCubit>(context);

    // Initialize the form with existing data
    editCubit.initializeEventData(myCreatedEventModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Event',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EditEventCubit, EditEventState>(
          listener: (context, state) {
            if (state is EditEventSuccessState) {
              showTwist(
                          state: ToastStates.success,
                          messege: state.message);

                          BlocProvider.of<MyCreatedEventsCubit>(context).getMyCreatedEvents();
                          // context.read<MyCreatedEventsCubit>().getRequestedMyEvents;
              navigateReplacment(context: context, route: Routes.bottomNavBar);
            }
          },
          builder: (context, state) {
            final editCubit = BlocProvider.of<EditEventCubit>(context);
            // editCubit.loadEventData();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: editCubit.editFormKey,
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
                        // const SizedBox(
                        //   height: 24,
                        // ),
                        // const FaceRecognition(),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NameOfLocation(
                          nameOfLocationController:
                              editCubit.editLocationController,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Street(
                          streetController: editCubit.editStreetController,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        District(
                          districtController: editCubit.editDistrictController,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                state is EditEventLoadingState? const CircularProgressIndicator():    CustomElevetedButton(
                            onPressed: () {
                              editCubit.editEvent(myCreatedEventModel.id);
                            },
                            text: 'Save')
                      
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
