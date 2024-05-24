import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:eventak/features/profile/data/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavouriteItem extends StatelessWidget {
  const CustomFavouriteItem({
    super.key, required this.myFavouriteModel,
  });
  final FavouriteModel myFavouriteModel;
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
          margin: const EdgeInsets.all(8),
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
                    image: myFavouriteModel.posterPicture['secure_url'],
                  ),
               const   SizedBox(
                    width: 16,
                  ),
                  TitleAndSubTitleOfEvent(
                    nameOfEvent: 
                    myFavouriteModel.nameOfEvent,
                    location:
                     myFavouriteModel.location['street'],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomElevetedButton(background: Colors.transparent,onPressed: (){
                context.read<MyCreatedEventsCubit>().getUsers(myFavouriteModel.nameOfEvent);
                navigate(context: context, route: Routes.requestsScreen);
                
              }, text: 'Show Event',)
            ],
          ),
        );
      },
    );
  }
}
