
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}
final class ChangeImageState extends CreateEventState {}
