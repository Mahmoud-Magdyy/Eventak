import 'dart:io';

import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateEventCubit, CreateEventState>(
      listener: (context, state) {},
      builder: (context, state) {
        final eventCubit = BlocProvider.of<CreateEventCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROFILE PICTURE OR LOGO TYPE',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: eventCubit.profileImage == null
                            ? const AssetImage(Assets.imagesCircleAvatarImage)
                            : FileImage(File(eventCubit.profileImage!.path))
                                as ImageProvider<Object>,
                        fit: BoxFit.cover,
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(

                          context: context,
                          builder: (context) {
                            return ImagePackerDialog(
                              cameraOnTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera).then(
                                    (value) => eventCubit.changeProfileImage(value));
                              },
                              galleryOnTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery).then(
                                    (value) => eventCubit.changeProfileImage(value));
                              },
                            );
                          });
                    },
                    child: Container(
                      width: 108,
                      height: 26,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1C5CA8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text('Upload New Photo',
                          textAlign: TextAlign.center,
                          style: AppStyles.styleSemiBold10(context)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Description About Your Event And This Information Will Be Displayed On The Details Section.',
              style: AppStyles.styleMedium10(context).copyWith(
                color: const Color(0xFF8591A0),
              ),
            ),
          ],
        );
      },
    );
  }
}
