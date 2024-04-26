
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OptionalDescriptionFormField extends StatelessWidget {
  const OptionalDescriptionFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OPTIONAL DESCRIPTION',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          maxLines: 4,
          hint: 'Start Typing...',
          controller: TextEditingController(),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Include Any Optional Description Or Details (For Example: All Photos Belong To The Organizer).',
          style: AppStyles.styleMedium10(context).copyWith(
            color: const Color(0xFF8591A0),
          ),
        ),
      ],
    );
  }
}
