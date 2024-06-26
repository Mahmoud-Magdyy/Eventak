import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarButtonsNewEvent extends StatelessWidget {
  const NavBarButtonsNewEvent({
    super.key,
    this.onTapFavourit,
    required this.allEventModel,
  });
  final Function()? onTapFavourit;
  final AllEventModel allEventModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomNewEventButton(
              icon: Icons.confirmation_num_outlined,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomNewEventButton(
              onTap: onTapFavourit,
              icon:
                  //  context.read<HomeCubit>().isSelectedFavoriteIcon
                  allEventModel.isCreator? Icons.how_to_reg_outlined :
                  allEventModel.
                   isFavourite
                      ?  Icons.favorite
                      :Icons.favorite_border_outlined  ,
            ),
            const SizedBox(
              width: 4,
            ),
            // const CustomNewEventButton(
            //   icon: Icons.ios_share_outlined,
            // ),
            const SizedBox(
              width: 4,
            ),
          ],
        );
      },
    );
  }
}
