import 'package:flutter/material.dart';

class CustomFavoriteButtom extends StatelessWidget {
  const CustomFavoriteButtom({
    super.key, this.onTap, this.heightContainer, this.widthContainer, this.sizeIcon, this.radius, this.widget,
  });
final Function()? onTap;
final double? heightContainer;
final double? widthContainer;
final double? sizeIcon;
final double? radius;
final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:widthContainer ?? 16,
      height:heightContainer?? 16,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?? 4)),
      ),
      child: 
      GestureDetector(
        onTap: onTap,
        child:widget?? 
        
         Icon(
              Icons.favorite_border_outlined,
              size:sizeIcon?? 10,
              color: Colors.orange,
            ),
      )
     
    );
  }
}
