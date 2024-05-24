import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatsIsIncludeFormField extends StatelessWidget {
  const WhatsIsIncludeFormField({
    super.key, required this.whatIsIncludedInPriceController,
  });
final TextEditingController whatIsIncludedInPriceController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What Is Included In Price',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              maxLines: 4,
              hint: 'Start Typing...',
              controller:whatIsIncludedInPriceController ,
              validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter What Is Included In Price';
                    }
                    return null;
                  },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Tell About All The Things That Are Included In The Ticket Price.',
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
