
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({
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
            'Basic Details',
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: Colors.black),
          ),
        ),
        Text(
          'This Section Contains The Basic Details Of Your Event.',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xFF8591A0)),
        ),
      ],
    );
  }
}
