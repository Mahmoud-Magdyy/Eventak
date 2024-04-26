import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/widgets/basic_details.dart';
import 'package:eventak/features/create_event/presentation/widgets/custom_app_bar.dart';
import 'package:eventak/features/create_event/presentation/widgets/date_and_time.dart';
import 'package:eventak/features/create_event/presentation/widgets/dropdown_category.dart';
import 'package:eventak/features/create_event/presentation/widgets/name_of_event.dart';
import 'package:eventak/features/create_event/presentation/widgets/poster_of_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateEventCubit, CreateEventState>(
        listener: (context, state) {},
        builder: (context, state) {
          final CreateEventCubit createCubit =
              BlocProvider.of<CreateEventCubit>(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: createCubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomCreateEventAppBar(),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: AppStyles.styleSemiBold14(context),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          DropDownCategory(createCubit: createCubit)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
