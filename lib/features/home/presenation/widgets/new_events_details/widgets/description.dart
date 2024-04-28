import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style:
              AppStyles.styleSemiBold16(context).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
         SizedBox(
          height: 100,
          child: Text(
            'Join us for Tech Summit 2024, where industry leaders, innovators, and enthusiasts come together to explore the latest trends and developments in technology. This full-day conference will feature keynote presentations, panel discussions and more.',
          style: AppStyles.styleMedium14(context).copyWith(color: const Color(0xFF676765)),),
        )
      ],
    );
  }
}
