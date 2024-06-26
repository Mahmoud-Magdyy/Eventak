import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/home/data/model/add_register_model.dart';
import 'package:eventak/features/my_events/data/models/get_users_model.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRequestItem extends StatelessWidget {
  const CustomRequestItem({
    super.key,
    required this.userModel,
    this.addRegisterModel,
    this.myRequestedEventModel,
    required this.onRemove,
  });

  final UserModel userModel;
  final RequestedInMyEventsModel? myRequestedEventModel;
  final AddRegisterModel? addRegisterModel;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
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
                userModel.firstName + userModel.lastName,
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
                onPressed: () {
                  context.read<MyCreatedEventsCubit>().declineRequest(userModel.email, userModel.nameOfEvent);
                  onRemove();
                },
                text: 'Decline',
                borderColor: Colors.grey,
                color: Colors.black,
                background: Colors.white,
              )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: CustomElevetedButton(
                onPressed: () {
                  context.read<MyCreatedEventsCubit>().acceptRequest(userModel.email, userModel.nameOfEvent);
                  onRemove();
                },
                text: 'Approve',
                background: Colors.green,
              )),
            ],
          )
        ],
      ),
    );
  }
}
