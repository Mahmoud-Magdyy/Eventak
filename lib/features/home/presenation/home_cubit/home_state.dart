
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class ChangeFavoriteIcon extends HomeState {}
final class CurrenIndexState extends HomeState {}
final class GetAllEventsLoadingState extends HomeState {}
final class GetAllEventsErrorState extends HomeState {
  final String message;

  GetAllEventsErrorState(this.message);
}
final class GetAllEventsSuccessState extends HomeState {
  final String message;

  GetAllEventsSuccessState({required this.message});
}
final class AddToFavouritLoadingState extends HomeState {}
final class AddToFavouritErrorState extends HomeState {
  final String message;

  AddToFavouritErrorState(this.message);
}
final class AddToFavouritSuccessState extends HomeState {
  final String message;

  AddToFavouritSuccessState(this.message);
}
final class RemoveFromFavouritLoadingState extends HomeState {}
final class RemoveFromFavouritErrorState extends HomeState {
  final String message;

  RemoveFromFavouritErrorState(this.message);
}
final class RemoveFromFavouritSuccessState extends HomeState {
  final String message;

  RemoveFromFavouritSuccessState(this.message);
}