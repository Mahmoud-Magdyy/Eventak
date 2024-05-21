import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/screens/my_created_event_details.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMyCreatedEventItemList extends StatelessWidget {
  const CustomMyCreatedEventItemList({
    super.key,
    required this.myCreatedEventModel,
    required this.deleteOnPressed,
  });
  final MyCreatedEventModel myCreatedEventModel;
  final Function() deleteOnPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
      listener: (context, state) {
        if (state is DeleteEventSuccessState) {
          showTwist(
              state: ToastStates.success, messege: 'Deleted Event Successfuly');
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          // width: 329,
          // height: 160,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomImageOfEvent(
                    image: myCreatedEventModel.posterPicture['secure_url'],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  TitleAndSubTitleOfEvent(
                    nameOfEvent: myCreatedEventModel.nameOfEvent,
                    location: myCreatedEventModel.location['street'],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevetedButton(
                      onPressed: () {
                        context
                            .read<MyCreatedEventsCubit>()
                            .deleteEvent(myCreatedEventModel.id);
                        
                      },
                      text: 'Delete Event',
                      background: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomElevetedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCreatedEeventDetails(
                                    myCreatedEventModel: myCreatedEventModel,
                                  )),
                        );
                      },
                      text: 'View Details',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
