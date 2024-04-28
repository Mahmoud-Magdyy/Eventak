import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/back_icon_and_fav.dart';
import 'package:eventak/features/home/presenation/widgets/new_events_details/widgets/image_of_event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewEeventDetails extends StatelessWidget {
  const NewEeventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateEventCubit, CreateEventState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    ImageOfEventDetails(),
                    Positioned(
                      top: 30,
                      left: 25,
                      right: 25,
                      child: BackIconAndFav(),
                    )
                  ],
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}

