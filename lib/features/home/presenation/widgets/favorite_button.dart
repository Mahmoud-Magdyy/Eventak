import 'package:flutter/material.dart';

class CustomFavoriteButtom extends StatelessWidget {
  const CustomFavoriteButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)),
      ),
      child: 
      GestureDetector(
        child: const Icon(
              Icons.favorite_border_outlined,
              size: 10,
              color: Colors.orange,
            ),
      )
     
    );
  }
}
