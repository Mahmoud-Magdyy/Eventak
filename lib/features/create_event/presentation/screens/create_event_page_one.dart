
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/widgets/basic_details.dart';
import 'package:eventak/features/create_event/presentation/widgets/date_and_time.dart';
import 'package:eventak/features/create_event/presentation/widgets/dropdown_category.dart';
import 'package:eventak/features/create_event/presentation/widgets/name_of_event.dart';
import 'package:eventak/features/create_event/presentation/widgets/poster_of_event.dart';
import 'package:eventak/features/create_event/presentation/widgets/price_of_the_ticket.dart';
import 'package:flutter/material.dart';

class CreateEventPageOne extends StatelessWidget {
  const CreateEventPageOne({
    super.key,
    required this.createCubit,
  });

  final CreateEventCubit createCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          const BasicDetails(),
          const SizedBox(
            height: 32,
          ),
          PosterOfEvent(createCubit: createCubit),
          const SizedBox(
            height: 26,
          ),
          const NameOfEvent(),
          const SizedBox(
            height: 26,
          ),
          DateAndTime(createCubit: createCubit),
          const SizedBox(
            height: 26,
          ),
          CategoryDrowpDown(createCubit: createCubit),
          const SizedBox(
            height: 26,
          ),
          const PriceOfTheTicket(),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
