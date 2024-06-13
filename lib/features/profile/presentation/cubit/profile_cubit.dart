import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/features/profile/data/models/edit_profile_model.dart';
import 'package:eventak/features/profile/data/models/favourite_model.dart';
import 'package:eventak/features/profile/data/models/get_profile_model.dart';
import 'package:eventak/features/profile/data/reposatoriy/edit_profile.dart';
import 'package:eventak/features/profile/data/reposatoriy/favourite_repo.dart';
import 'package:eventak/features/profile/data/reposatoriy/profile_repo.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileReposatiry, this.getMyFavouriteEventsRepo,
      this.editProfileRepo)
      : super(ProfileInitial());
  ProfileModel? profileModel;
  final ProfileReposatiry profileReposatiry;
  void getProfile() async {
    emit(GetProfilesLoadingState());
    final result = await profileReposatiry.getProfile();

    result.fold((l) => emit(GetProfilesErrorState()), (r) {
      profileModel = r;
      emit(GetProfilesSuccessState());
    });
  }

  //! get My Favourite events
  List<FavouriteModel> myFavouriteEventList = [];
  FavouriteModel? favouriteModel;
  final GetMyFavouritesEventsReposatiry getMyFavouriteEventsRepo;
  void getMyFavouriteEvents() async {
    emit(GetMyFavouriteEventsLoadingState());
    final result = await getMyFavouriteEventsRepo.getMyFavouriteEvents();
    result.fold((l) => emit(GetMyFavouriteEventsErrorState(message: l)), (r) {
      // favouriteModel = r.data;
      myFavouriteEventList = r.data;
      emit(GetMyFavouriteEventsSuccessState());
    });
  }
void resetCubit() {
    emit(ProfileInitial());
  }
  //! edit profle
  XFile? profileImage;
  void editProfileImage(value) {
    profileImage = value;
    emit(ChangeProfileImageState());
  }

  bool isProfileImageSelected() {
    return profileImage != null;
  }

  TextEditingController editFristNameController = TextEditingController();
  TextEditingController editLastNameController = TextEditingController();
  //! edit event method
  final EditProfileRepo editProfileRepo;
  EditProfileModel? editProfileModel;
  void initializeEventData(ProfileModel profileModel) {
    editFristNameController.text = profileModel.firstName;
    editLastNameController.text = profileModel.lastName;
    emit(EditProfileDataInitialized());
  }

  void editProfile() async {
    emit(EditProfileLoadingState());

    final data = <String, dynamic>{};
    if (profileImage != null) {
      data['profilePic'] = await uploadImageToAPI(profileImage!);
    }
    if (editFristNameController.text.isNotEmpty) {
      data['firstName'] = editFristNameController.text;
    }
    if (editLastNameController.text.isNotEmpty) {
      data['lastName'] = editLastNameController.text;
    }

    final result = await editProfileRepo.editProfile(data: data);

    result.fold((l) => emit(EditProfileErrorState(l)), (r) async {
      editProfileModel = r;
      emit(EditProfileSuccessState(r.status));
    });
  }
}
