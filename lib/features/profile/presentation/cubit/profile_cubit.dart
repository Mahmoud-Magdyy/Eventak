

import 'package:eventak/features/profile/data/models/get_profile_model.dart';
import 'package:eventak/features/profile/data/reposatoriy/profile_repo.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileReposatiry) : super(ProfileInitial());
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
}
