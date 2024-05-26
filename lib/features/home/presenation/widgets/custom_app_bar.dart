import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesEventakImage),
        Row(
          children: [
            InkWell(
              onTap: () {
                navigate(context: context, route: Routes.searchScreen);
              },
              borderRadius: BorderRadius.circular(16),
              child: const Icon(
                Icons.search_outlined,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            // InkWell(
            //   onTap: () {},
            //   borderRadius: BorderRadius.circular(16),
            //   child: const Icon(Icons.qr_code),
            // ),
            // const SizedBox(
            //   width: 8,
            // ),
          ],
        )
      ],
    );
  }
}
