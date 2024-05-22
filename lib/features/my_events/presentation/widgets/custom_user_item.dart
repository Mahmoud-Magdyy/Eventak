
  import 'package:eventak/core/utils/app_styles.dart';
  import 'package:eventak/core/widgets/custom_button.dart';
  import 'package:eventak/features/home/data/model/add_register_model.dart';
  import 'package:eventak/features/my_events/data/models/get_users_model.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
  import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  class CustomRequestItem extends StatelessWidget {
    const CustomRequestItem({
      super.key, required this.userModel, this.addRegisterModel, this.myRequestedEventModel,
    });
  final UserModel userModel;
  final RequestedInMyEventsModel? myRequestedEventModel;
  final AddRegisterModel? addRegisterModel;
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
                  onPressed: () {

                  },
                  text: 'Decline',
                  background: Colors.transparent,
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: CustomElevetedButton(
                        onPressed: 
                        () {
                          // context.read<MyCreatedEventsCubit>().acceptRequest(userModel.);
                          context.read<MyCreatedEventsCubit>().acceptRequest(userModel.email,);
                          // print('this id::: ${userModel.email}');
                          print('namge of ::: ${context.read<MyCreatedEventsCubit>().requestedInMyEventsModel!.nameOfEvent }');
                        },
                        text: 'Approve',
                        background: Colors.green)),
              ],
            )
          ],
        ),
      );
    }
  }
