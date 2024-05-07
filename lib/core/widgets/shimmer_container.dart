import 'package:flutter/material.dart';

class ContainerShammer extends StatelessWidget {
  const ContainerShammer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 395,
        height: 262,
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
