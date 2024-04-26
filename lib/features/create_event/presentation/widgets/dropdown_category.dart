
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';

class DropDownCategory extends StatelessWidget {
  const DropDownCategory({
    super.key,
    required this.createCubit,
  });

  final CreateEventCubit createCubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        icon: const Icon(
            Icons.keyboard_arrow_down_outlined),
        hint: Text(
          'Hobbies & Interests',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xff7091B9)),
        ),
        items: createCubit.items,
        onChanged: (value) {
          createCubit.dropDownValue = value;
        });
  }
}
