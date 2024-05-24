import 'dart:io';

import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/image_picker_dialog.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditPosterOfEvent extends StatelessWidget {
  const EditPosterOfEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditEventCubit, EditEventState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<EditEventCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'POSTER OF EVENT',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  width: 361,
                  height: 144,
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: context.read<EditEventCubit>().editPosterImage == null
                          ? const AssetImage(Assets.imagesWhite)
                          : FileImage(
                                  File(cubit.editPosterImage!.path))
                              as ImageProvider<Object>,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF0B2442)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ImagePackerDialog(
                                    cameraOnTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera).then(
                                          (value) => cubit
                                              .changeEditPosterImage(value));
                                    },
                                    galleryOnTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.gallery).then(
                                          (value) => cubit
                                              .changeEditPosterImage(value));
                                    },
                                  );
                                });
                          },
                          child: const Icon(Icons.camera)),
                      const Text('Add Image Or Poster'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'This Is The Main Photo That Will Be Displayed In Home Page.',
              style: AppStyles.styleMedium10(context)
                  .copyWith(color: const Color(0xFF8591A0)),
            )
          ],
        );
      },
    );
  }
}
