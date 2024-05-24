

import 'package:eventak/features/profile/data/models/favourite_model.dart';
import 'package:eventak/features/profile/data/models/get_profile_model.dart';
import 'package:eventak/features/profile/data/reposatoriy/favourite_repo.dart';
import 'package:eventak/features/profile/data/reposatoriy/profile_repo.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileReposatiry, this.getMyFavouriteEventsRepo) : super(ProfileInitial());
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
  final GetMyFavouritesEventsReposatiry getMyFavouriteEventsRepo;
  void getMyFavouriteEvents() async {
    emit(GetMyFavouriteEventsLoadingState());
    final result = await getMyFavouriteEventsRepo.getMyFavouriteEvents();
    result.fold((l) => emit(GetMyFavouriteEventsErrorState(message: l)), (r) {
      myFavouriteEventList = r.data;
      emit(GetMyFavouriteEventsSuccessState());
    });
  }
}
