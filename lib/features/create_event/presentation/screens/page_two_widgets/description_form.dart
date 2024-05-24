import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    super.key, required this.descriptionController,
  });
final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              maxLines: 4,
              hint: 'Start Typing...',
              controller:descriptionController ,
              validate: (data) {
                    if (data!.length < 40 || data.isEmpty) {
                      return 'Please Enter At least 40 Charactar';
                    }
                    return null;
                  },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Description About Your Event And This Information Will Be Displayed On The Details Section.',
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
