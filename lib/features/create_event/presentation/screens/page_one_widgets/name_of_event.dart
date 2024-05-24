import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameOfEvent extends StatelessWidget {
  const NameOfEvent({
    super.key, required this.nameController,
  });
final TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NAME OF EVENT',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ), //Name Of Event
            CustomTextFormField(
              controller: nameController,
              hint: 'E.G Miniproject',
              validate: (data) {
                    if (data!.length < 15 || data.isEmpty) {
                      return 'Please Enter At least 15 Charactar';
                    }
                    return null;
                  },
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'This Title Will Be Displayed On The Home Page And Social Media.',
              style: AppStyles.styleMedium10(context).copyWith(
                color: const Color(0xFF8591A0),
              ),
            ),
          ],
        );
      },
    );
  }
}
