import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NameOfEvent extends StatelessWidget {
  const NameOfEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAME OF EVENT',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          controller: TextEditingController(),
          hint: 'E.G Miniproject',
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'This Title Will Be Displayed On The Home Page And Social Media.',
          style: AppStyles.styleMedium10(context).copyWith(
            color: const Color(0xFF8591A0),
          ),
        ),
      ],
    );
  }
}
