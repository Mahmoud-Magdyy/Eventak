
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
final class ChangeFaceIdPhoto extends MyCreatedEventsState {}
final class ModelAiLoadingState extends MyCreatedEventsState {}

final class ModelAiSuccessState extends MyCreatedEventsState {
  final String message;

  ModelAiSuccessState( this.message);
}
final class ModelAiErrorState extends MyCreatedEventsState {
  final String message;

  ModelAiErrorState( this.message);
}

final class GetRequestedMyEventsLoadingState extends MyCreatedEventsState {}
final class GetRequestedMyEventsSuccessState extends MyCreatedEventsState {
 
}
final class GetRequestedMyEventsErrorState extends MyCreatedEventsState {
  final String message;

  GetRequestedMyEventsErrorState({required this.message});
}

final class GetUsersLoadingState extends MyCreatedEventsState {}
final class GetUsersSuccessState extends MyCreatedEventsState {
 
}
final class GetUsersErrorState extends MyCreatedEventsState {
  final String message;

  GetUsersErrorState({required this.message});
}
final class AcceptRequestLoadingState extends MyCreatedEventsState {}
final class AcceptRequestSuccessState extends MyCreatedEventsState {
 
}
final class AcceptRequestErrorState extends MyCreatedEventsState {
  final String message;

  AcceptRequestErrorState({required this.message});
}
final class DeclineRequestLoadingState extends MyCreatedEventsState {}
final class DeclineRequestSuccessState extends MyCreatedEventsState {
 
}
final class DeclineRequestErrorState extends MyCreatedEventsState {
  final String message;

  DeclineRequestErrorState({required this.message});
}

