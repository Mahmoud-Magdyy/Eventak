import 'package:flutter/material.dart';

class TextOfEvent extends StatelessWidget {
  const TextOfEvent({
    super.key, required this.textOfNewEvent,
  });
  final String textOfNewEvent;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 160,
      height: 72,
      child: Text(
        maxLines: 6,
        textOfNewEvent,
        // textAlign: TextAlign.left,
        style: const TextStyle(
          color: Color(0xFF8591A0),
          fontSize: 8,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
          // height: 0.19,
        ),
      ),
    );
  }
}
