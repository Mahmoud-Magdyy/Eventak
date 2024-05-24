sealed class EditEventState {}

final class EditEventInitial extends EditEventState {}
final class ChangeEditPosterImageState extends EditEventState {}
final class ChangeEditProfileImageState extends EditEventState {}
final class GetEditDateLoading extends EditEventState {}
final class GetEditDateSuccess extends EditEventState {}
final class GetEditDateError extends EditEventState {}
final class GetEditStartDateLoading extends EditEventState {}
final class GetEditStartDateSuccess extends EditEventState {}
final class GetEditStartDateError extends EditEventState {}
final class GetEditEndDateLoading extends EditEventState {}
final class GetEditEndDateSuccess extends EditEventState {}
final class GetEditEndDateError extends EditEventState {}
final class ChangeEditCheckBoxSuccess extends EditEventState {}
final class EditEventLoadingState extends EditEventState {}
final class EditEventErrorState extends EditEventState {
  final String message;
  EditEventErrorState(this.message);
}
final class EditEventSuccessState extends EditEventState {
  final String message;
  EditEventSuccessState(this.message);
}
