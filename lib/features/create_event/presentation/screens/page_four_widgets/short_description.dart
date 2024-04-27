import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ShortDescription extends StatelessWidget {
  const ShortDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SHORT DESCRIPTION',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          controller: TextEditingController(),
          hint: 'Description',
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'This Description Will Be Shown Along With The Organizer Logo.',
          style: AppStyles.styleMedium10(context).copyWith(
            color: const Color(0xFF8591A0),
          ),
        ),
      ],
    );
  }
}
