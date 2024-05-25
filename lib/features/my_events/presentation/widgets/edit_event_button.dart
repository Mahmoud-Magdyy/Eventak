
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/screens/edit_event_screen.dart';
import 'package:flutter/material.dart';

class CustomEditEventButton extends StatelessWidget {
  const CustomEditEventButton({
    super.key,required this.myCreatedEventModel,
  });
final MyCreatedEventModel myCreatedEventModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditEventScreen(myCreatedEventModel: myCreatedEventModel),
  ),
);
      },
      child: Container(
        // width: 80,
        // height: 28,
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          color: const Color(0xFFDEE9F5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
        ),
        child:  Text('Edit Event',style: AppStyles.styleMedium12(context).copyWith(color: const Color(0xFF18388F)),),
      ),
    );
  }
}