
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}
final class ChangeImageState extends CreateEventState {}
final class GetDateLoading extends CreateEventState {}
final class GetDateSuccess extends CreateEventState {}
final class GetDateError extends CreateEventState {}
final class GetStartDateLoading extends CreateEventState {}
final class GetStartDateSuccess extends CreateEventState {}
final class GetStartDateError extends CreateEventState {}
final class GetEndDateLoading extends CreateEventState {}
final class GetEndDateSuccess extends CreateEventState {}
final class GetEndDateError extends CreateEventState {}
