
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Description',
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: Colors.black),
          ),
        ),
        Text(
          'Write About Your Event And Other Details User Need To Know.',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xFF8591A0)),
        ),
      ],
    );
  }
}
