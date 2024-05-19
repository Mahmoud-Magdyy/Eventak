
sealed class MyCreatedEventsState {}

final class MyCreatedEventsInitial extends MyCreatedEventsState {}
final class GetMyCreatedEventsLoadingState extends MyCreatedEventsState {}
final class GetMyCreatedEventsSuccessState extends MyCreatedEventsState {
  final String message;

  GetMyCreatedEventsSuccessState({required this.message});
}
final class GetMyCreatedEventsErrorState extends MyCreatedEventsState {
  final String message;

  GetMyCreatedEventsErrorState({required this.message});
}
