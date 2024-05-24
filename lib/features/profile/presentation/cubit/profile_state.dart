
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