
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}
final class ChangeImageState extends CreateEventState {}
final class ClearFieldsState extends CreateEventState {}
final class GetDateLoading extends CreateEventState {}
final class GetDateSuccess extends CreateEventState {}
final class GetDateError extends CreateEventState {}
final class GetStartDateLoading extends CreateEventState {}
final class GetStartDateSuccess extends CreateEventState {}
final class GetStartDateError extends CreateEventState {}
final class GetEndDateLoading extends CreateEventState {}
final class GetEndDateSuccess extends CreateEventState {}
final class GetEndDateError extends CreateEventState {}
final class ChangeProfileImageState extends CreateEventState {}
final class ChangeCheckBoxSuccess extends CreateEventState {}
//!methods
final class CretaeEventLoadingState extends CreateEventState {}
final class CretaeEventErrorState extends CreateEventState {

  final String message;

  CretaeEventErrorState(this.message);
}
final class CretaeEventSuccessState extends CreateEventState {
  final String message;

  CretaeEventSuccessState(this.message);
}

