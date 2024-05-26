
import 'package:eventak/features/home/presenation/widgets/trending_widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class BackIconAndFav extends StatelessWidget {
  const BackIconAndFav({
    super.key, this.widget,
  });
final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
          )),
        ),
   widget?? const CustomFavoriteButtom(
    
    heightContainer: 32,widthContainer: 32,sizeIcon: 22,radius: 16,)
      ],
    );
  }
}
