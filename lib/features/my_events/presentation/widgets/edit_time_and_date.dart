import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditDateAndTime extends StatelessWidget {
  const EditDateAndTime({
    super.key,
    required this.editEventCubit,
  });

  final EditEventCubit editEventCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DATE & TIME',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                      hint: editEventCubit.startTime,
                      icon: Icons.timer_outlined,
                      suffixIconOnPressed: () {
                        editEventCubit.getStartDate(context);
                      },
                      controller: 
                      context.read<EditEventCubit>().editStartTimeController,
                      validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter Start Time';
                    }
                    return null;
                  },
                      ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                      color: const Color(0xFFF8FAFB),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.75, color: Color(0xFF7091B9)),
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 16,
                    color: Color(0xFF7091B9),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextFormField(
                      hint: editEventCubit.endTime,
                      icon: Icons.timer_outlined,
                      suffixIconOnPressed: () {
                        editEventCubit.getEndDate(context);
                      },
                      controller: context.read<EditEventCubit>().editEndTimeController,validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter End Time';
                    }
                    return null;
                  },),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              readOnly: true,
              icon: Icons.calendar_today_outlined,
              suffixIconOnPressed: () async {
                editEventCubit.getDate(context);
              },
              controller:  context.read<EditEventCubit>().editDateController,
              hint: DateFormat.MMMMEEEEd().format(editEventCubit.currentDate),
              validate: (data) {
                    if (data!.isEmpty) {
                      return 'Please Enter Date';
                    }
                    return null;
                  },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Date & Total Duration Of Your Event.',
              style: AppStyles.styleMedium10(context).copyWith(
                color: const Color(0xFF8591A0),
              ),
            )
          ],
        );
      },
    );
  }
}
