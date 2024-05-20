
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
final class DeleteEventLoadingState extends MyCreatedEventsState {}
final class DeleteEventSuccessState extends MyCreatedEventsState {
  final String message;

  DeleteEventSuccessState({required this.message});
}
final class DeleteEventErrorState extends MyCreatedEventsState {
  final String message;

  DeleteEventErrorState({required this.message});
}