import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryDrowpDown extends StatelessWidget {
  const CategoryDrowpDown({
    super.key,
    required this.onChanged,  this.items,
  });

  // final CreateEventCubit createCubit;
final Function(dynamic) onChanged;
final List<DropdownMenuItem<dynamic>>? items;
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
            items: items,
            validator: (data) {
              if (data == null) {
                return 'Please Enter Category ';
              }
              return null;
            },
            onChanged: onChanged,
            // (value) {
            //   createCubit.dropDownValue = value;
            //   createCubit.category = value;
            // }
            ),
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
