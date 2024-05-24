import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameOfLocation extends StatelessWidget {
  const NameOfLocation({
    super.key, required this.nameOfLocationController,
  });
final TextEditingController nameOfLocationController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NAME OF LOCATION',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              controller:nameOfLocationController ,
              hint: 'NAME OF LOCATION',
              validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter Name Of Loaction';
                    }
                    return null;
                  },
            ),
          ],
        );
      },
    );
  }
}
