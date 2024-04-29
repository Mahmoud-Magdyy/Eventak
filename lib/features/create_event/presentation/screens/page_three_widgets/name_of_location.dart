import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NameOfLocation extends StatelessWidget {
  const NameOfLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAME OF LOCATION',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          controller: TextEditingController(),
          hint: 'NAME OF LOCATION',
        ),
      ],
    );
  }
}