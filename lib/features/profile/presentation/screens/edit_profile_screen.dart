import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/profile/data/models/get_profile_model.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:eventak/features/profile/presentation/widgets/custom_edit_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.profileModel});
  final ProfileModel? profileModel;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    cubit.initializeEventData(cubit.profileModel!);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccessState) {
          cubit.getProfile();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Profile",
              style: AppStyles.styleBold18(context),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  CustomEditImage(
                    profileCubit: cubit,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomTextFormField(
                      hint: 'First Name',
                      prefixIcon: const Icon(Icons.person_pin_outlined),
                      controller: cubit.editFristNameController),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                      hint: 'Last Name',
                      prefixIcon: const Icon(Icons.person_pin_outlined),
                      controller: cubit.editLastNameController),
                  // const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  state is EditProfileLoadingState
                      ? const CircularProgressIndicator(color: AppColors.primaryColor,)
                      : CustomElevetedButton(
                          onPressed: () {
                            cubit.editProfile();
                          },
                          text: 'Upadte')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
