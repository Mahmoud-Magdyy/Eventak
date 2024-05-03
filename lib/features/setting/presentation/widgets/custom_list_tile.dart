import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.image, required this.title, this.onTap,
  });
  final String image;
  final String title;
  final Function()? onTap;
  // final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          tileColor: Colors.white,
          leading: SvgPicture.asset(image),
          title:  Text(title),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
          titleTextStyle: AppStyles.styleRegular16(context),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
