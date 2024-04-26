import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class District extends StatelessWidget {
  const District({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          controller: TextEditingController(),
          hint: 'Place',
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
  }
}
