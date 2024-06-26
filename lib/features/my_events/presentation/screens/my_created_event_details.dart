import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/image_picker_dialog.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/brought_to_you.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/catregory_item.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/description.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/include_in_the_price.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/location_and_time.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/widgets/edit_event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/my_created_events_state.dart';

// ignore: must_be_immutable
class MyCreatedEeventDetails extends StatelessWidget {
  MyCreatedEeventDetails({super.key, this.myCreatedEventModel});
  MyCreatedEventModel? myCreatedEventModel;
  @override
  Widget build(BuildContext context) {
    if (myCreatedEventModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
            listener: (context, state) {
              if (state is ModelAiSuccessState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is ModelAiErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ImageOfEventDetails(
                                        image: myCreatedEventModel!.posterPicture['secure_url'],
                                      ),
                                      Positioned(
                                        top: 30,
                                        left: 25,
                                        right: 25,
                                        child: BackIconAndFav(
                                          widget: CustomEditEventButton(
                                            myCreatedEventModel: myCreatedEventModel!,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 220,
                                              child: FittedBox(
                                                child: Text(
                                                  myCreatedEventModel!.nameOfEvent,
                                                  maxLines: 2,
                                                  style: AppStyles.styleSemiBold24(context).copyWith(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            CategoryItemDetails(
                                              icon: Icons.track_changes,
                                              nameOfIconCateogry: myCreatedEventModel!.category,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        LocationAndTimeAndDateNewEventDetails(
                                          location: '${myCreatedEventModel!.location['street']}, ${myCreatedEventModel!.location['nameOfLocation']}',
                                          dateMonth: myCreatedEventModel!.date,
                                          dateTime: '${myCreatedEventModel!.startTime} - ${myCreatedEventModel!.endTime}',
                                        ),
                                        const SizedBox(height: 32),
                                        Description(description: myCreatedEventModel!.description),
                                        const SizedBox(height: 24),
                                        BroughtToYou(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ImagePackerDialog(
                                                  widget: true,
                                                  cameraOnTap: () {
                                                    pickImage(ImageSource.camera).then(
                                                      (value) => context.read<MyCreatedEventsCubit>().changeFaceIdPhoto(value),
                                                    );
                                                  },
                                                  send: 'Send',
                                                  galleryOnTap: () {
                                                    Navigator.pop(context);
                                                    context.read<MyCreatedEventsCubit>().model();
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          name: myCreatedEventModel!.broughtToYouBy,
                                          url: myCreatedEventModel!.creatorPicture['secure_url'],
                                        ),
                                        const SizedBox(height: 16),
                                        IncludeThePrice(includeInPrice: myCreatedEventModel!.whatIsIncludedInPrice),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (state is ModelAiLoadingState)
                    Scaffold(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      body: const Center(
                        child: CircularProgressIndicator(color: AppColors.primaryColor,),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      );
    }
  }
}
