import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });
  final String description;
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
            description,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: const Color(0xFF676765)),
          ),
        )
      ],
    );
  }
}
