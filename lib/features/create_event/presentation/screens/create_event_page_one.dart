
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/basic_details.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/date_and_time.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/dropdown_category.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/name_of_event.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/poster_of_event.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/price_of_the_ticket.dart';
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
            height: 26,
          ),
          const BasicDetails(),
          const SizedBox(
            height: 32,
          ),
          PosterOfEvent(createCubit: createCubit),
          const SizedBox(
            height: 26,
          ),
           NameOfEvent(nameController: createCubit.nameOfEventController,),
          const SizedBox(
            height: 26,
          ),
          DateAndTime(createCubit: createCubit),
          const SizedBox(
            height: 26,
          ),
          CategoryDrowpDown(
            items: createCubit.items,
            onChanged: (value){
              createCubit.dropDownValue = value;
              createCubit.category = value;
          },),
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
