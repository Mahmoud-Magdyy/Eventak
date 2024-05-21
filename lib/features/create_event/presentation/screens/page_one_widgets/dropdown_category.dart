import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';

class CategoryDrowpDown extends StatelessWidget {
  const CategoryDrowpDown({
    super.key,
    required this.createCubit,
  });

  final CreateEventCubit createCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 4,
        ),
        DropdownButtonFormField(
            style: AppStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff7091B9)),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            hint: Text(
              'Hobbies & Interests',
              style: AppStyles.styleMedium16(context)
                  .copyWith(color: const Color(0xff7091B9)),
            ),
            items: createCubit.items,
            validator: (data) {
              if (data == null) {
                return 'Please Enter Category ';
              }
              return null;
            },
            onChanged: (value) {
              createCubit.dropDownValue = value;
              createCubit.category = value;
            }),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Choose A Category From Our List Match With The Type Of Your Event.',
          style: AppStyles.styleMedium10(context).copyWith(
            color: const Color(0xFF8591A0),
          ),
        )
      ],
    );
  }
}
