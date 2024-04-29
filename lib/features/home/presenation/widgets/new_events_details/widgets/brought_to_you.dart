
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BroughtToYou extends StatelessWidget {
  const BroughtToYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Brought to you by',style: AppStyles.styleSemiBold16(context).copyWith(color: Colors.black),),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const ShapeDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(
                //       "https://via.placeholder.com/32x32"),
                //   fit: BoxFit.fill,
                // ),
                shape: OvalBorder(),
                color: AppColors.lightBlue,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'CityTech Events',
              style: AppStyles.styleSemiBold14(context)
                  .copyWith(color: Colors.black),
            ),
            const Spacer(),
            SvgPicture.asset(Assets.imagesFaceId)
          ],
        )
      ],
    );
  }
}