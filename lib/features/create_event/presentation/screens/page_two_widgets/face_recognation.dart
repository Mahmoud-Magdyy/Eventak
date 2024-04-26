import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FaceRecognition extends StatelessWidget {
  const FaceRecognition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FACE RECOGNITION',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 361,
          height: 128,
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.face,
                size: 70,
              ),
              const Text('Secure Your Event'),
              Switch(
                  activeColor: AppColors.lightBlue,
                  value: true,
                  onChanged: (value) {
                    value = false;
                  })
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Description About Your Event And This Information Will Be Displayed On The Details Section.',
          style: AppStyles.styleMedium10(context).copyWith(
            color: const Color(0xFF8591A0),
          ),
        ),
      ],
    );
  }
}
