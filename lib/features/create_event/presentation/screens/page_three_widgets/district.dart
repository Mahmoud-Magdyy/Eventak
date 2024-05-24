import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class District extends StatelessWidget {
  const District({
    super.key, required this.districtController,
  });
final TextEditingController districtController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DISTRICT',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              controller:districtController ,
              hint: 'Place',
              validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter District';
                    }
                    return null;
                  },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '''Name And Address Of The Place You Are Hosting Your Event.
    This Will Shown In The Details Section.''',
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
