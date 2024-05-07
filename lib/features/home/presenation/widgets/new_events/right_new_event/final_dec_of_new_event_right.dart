import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/bloc/cubit/global_state.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/custom_list_tile_location_of_event.dart.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/custom_list_tile_price_of_event.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/custom_list_tile_time_of_event.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/right_new_event/nav_bar_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DecOfNewEventRight extends StatelessWidget {
  const DecOfNewEventRight({
    super.key,
    required this.nameOfEvent,
    required this.titleDateOfTicket,
    required this.endTimeOfEvent,
    required this.startTimeOfEvent,
    required this.titleLocationOfEvent,
    required this.subTitleLocationOfEvent,
    required this.titlePriceOfEvent,
    required this.subTitlePriceOfEvent,
  });
  final String nameOfEvent;
  final String titleDateOfTicket;
  final String titleLocationOfEvent;
  final String subTitleLocationOfEvent;
  final String titlePriceOfEvent;
  final String subTitlePriceOfEvent;
  final String startTimeOfEvent;
  final String endTimeOfEvent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 246,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 176,
          height: 246,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: const ShapeDecoration(
            color: AppColors.colorCategoryName,
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackgroundContainer),
              opacity: 0.10,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          child: Column(
            children: [
              Text(nameOfEvent,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleSemiBoldWhite12(context)),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<GlobalCubit, GlobalState>(
                builder: (context, state) {
                  return Stack(children: [
                    Transform.rotate(
                      angle:
                          BlocProvider.of<GlobalCubit>(context).langCode == 'ar'
                              ? 3.14
                              : 0.0,
                      child: SvgPicture.asset(Assets.imagesVector),
                    ),
                    Positioned(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CustomListTileTitmeOfEvent(
                            textTitle: titleDateOfTicket,
                            startTime: startTimeOfEvent,
                            endTime: endTimeOfEvent,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomListTileLocationOfEvent(
                            textTitle: titleLocationOfEvent,
                            textSubTitle: subTitleLocationOfEvent,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomListTilePriceOfEvent(
                            textTitle: titlePriceOfEvent,
                            textSubTitle: subTitlePriceOfEvent,
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          const NavBarButtonsNewEvent()
                        ],
                      ),
                    )
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
