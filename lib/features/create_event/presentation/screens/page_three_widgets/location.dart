
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
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
            'Location',
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: Colors.black),
          ),
        ),
        Text(
          'Details About Where Your Event Will Be Conducted.',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xFF8591A0)),
        ),
      ],
    );
  }
}
