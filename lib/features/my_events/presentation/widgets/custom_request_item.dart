import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRequestedEventItemList extends StatelessWidget {
  const CustomRequestedEventItemList({
    super.key, required this.myRequestedEventModel,
  });
  final RequestedInMyEventsModel myRequestedEventModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
      listener: (context, state) {
        // if (state is DeleteEventSuccessState) {
        //   showTwist(
        //       state: ToastStates.success, messege: 'Deleted Event Successfuly');
        // }
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
                    image: myRequestedEventModel.posterPicture['secure_url'],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  TitleAndSubTitleOfEvent(
                    nameOfEvent: 
                    myRequestedEventModel.nameOfEvent,
                    location:
                     myRequestedEventModel.location['street'],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomElevetedButton(background: Colors.transparent,onPressed: (){}, text: 'View Requests')
            ],
          ),
        );
      },
    );
  }
}
