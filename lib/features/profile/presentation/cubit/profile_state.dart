
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class GetProfilesLoadingState extends ProfileState {}
final class GetProfilesSuccessState extends ProfileState {
  
}
final class GetProfilesErrorState extends ProfileState {
  
}
