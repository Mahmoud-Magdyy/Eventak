import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNewEventButton extends StatelessWidget {
  const CustomNewEventButton({
    super.key, required this.icon, this.onTap,  this.isSelectedFavoriteIcon,
  });
final IconData icon;
final Function()? onTap;
final bool? isSelectedFavoriteIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: Colors.blue[900],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8)),
        ),
        child: InkWell(
          onTap: onTap,
          child:  Icon(
            icon,
            color: AppColors.white,
            size: 16,
          ),
        ),);
  }
}
