
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/data/models/get_users_model.dart';
import 'package:flutter/material.dart';

class CustomRequestItem extends StatelessWidget {
  const CustomRequestItem({
    super.key, required this.userModel,
  });
final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 361,
      // height: 160,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
               CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(userModel.profilePic['secure_url']),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                userModel.firstName+userModel.lastName,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomElevetedButton(
                onPressed: () {},
                text: 'Decline',
                background: Colors.transparent,
              )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: CustomElevetedButton(
                      onPressed: () {},
                      text: 'Approve',
                      background: Colors.green)),
            ],
          )
        ],
      ),
    );
  }
}
