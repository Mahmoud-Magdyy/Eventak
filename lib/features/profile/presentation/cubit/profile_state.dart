
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class GetProfilesLoadingState extends ProfileState {}
final class GetProfilesSuccessState extends ProfileState {
  
}
final class GetProfilesErrorState extends ProfileState {
  
}

final class GetMyFavouriteEventsLoadingState extends ProfileState {}
final class GetMyFavouriteEventsSuccessState extends ProfileState {
  
}
final class GetMyFavouriteEventsErrorState extends ProfileState {
  final String message;

  GetMyFavouriteEventsErrorState({required this.message});
}
final class ChangeProfileImageState extends ProfileState {}
final class EditProfileDataInitialized extends ProfileState {}
final class EditProfileLoadingState extends ProfileState {}
final class EditProfileErrorState extends ProfileState {
  final String message;

  EditProfileErrorState(this.message);
}
final class EditProfileSuccessState extends ProfileState {
  final String message;

  EditProfileSuccessState(this.message);
}