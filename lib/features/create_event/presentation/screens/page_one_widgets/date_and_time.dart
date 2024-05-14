import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({
    super.key,
    required this.createCubit,
  });

  final CreateEventCubit createCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
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
                      hint: createCubit.startTime,
                      icon: Icons.timer_outlined,
                      suffixIconOnPressed: () {
                        createCubit.getStartDate(context);
                      },
                      controller: context.read<CreateEventCubit>().statrTimeOfEventController
                      
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
                      hint: createCubit.endTime,
                      icon: Icons.timer_outlined,
                      suffixIconOnPressed: () {
                        createCubit.getEndDate(context);
                      },
                      controller: context.read<CreateEventCubit>().endTimeOfEventController),
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
                createCubit.getDate(context);
              },
              controller:  context.read<CreateEventCubit>().dateController,
              hint: DateFormat.MMMMEEEEd().format(createCubit.currentDate),
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
