
sealed class HomeState {}

final class HomeInitial extends HomeState {}
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
