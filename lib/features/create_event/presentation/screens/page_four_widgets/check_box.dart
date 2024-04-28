
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
    required this.createCubit,
  });

  final CreateEventCubit createCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
            // fillColor:
            //     const MaterialStatePropertyAll(AppColors.primaryColor),
            activeColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.grey),
            value: createCubit.checkBoxValue,
            onChanged: (value) {
              createCubit.onChangedCheckBoxValue(value);
            }),
        Text('I Have Agreed To Our Terms & Conditions',
            style: AppStyles.styleSemiBold16(context)),
      ],
    );
  }
}
