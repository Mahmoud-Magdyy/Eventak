import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
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
        // if (state is GetUsersSuccessState) {
        //  navigate(context: context, route: Routes.requestsScreen);
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
               const   SizedBox(
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
              CustomElevetedButton(background: Colors.white,borderColor: Colors.grey,onPressed: (){
                context.read<MyCreatedEventsCubit>().getUsers(myRequestedEventModel.nameOfEvent);
                navigate(context: context, route: Routes.requestsScreen);
                
              }, text: 'View Requests',color: Colors.black,)
            ],
          ),
        );
      },
    );
  }
}
