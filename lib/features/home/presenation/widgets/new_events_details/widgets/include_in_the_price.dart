import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IncludeThePrice extends StatelessWidget {
  const IncludeThePrice({
    super.key,
    required this.includeInPrice,
  });
  final String includeInPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Include in price',
          style:
              AppStyles.styleSemiBold16(context).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: Text(
            overflow: TextOverflow.ellipsis,
            includeInPrice,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: const Color(0xFF676765)),
          ),
        )
      ],
    );
  }
}
