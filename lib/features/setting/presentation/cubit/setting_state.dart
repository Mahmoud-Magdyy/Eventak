
sealed class SettingState {}

final class SettingInitial extends SettingState {}
final class LogOutLoadingState extends SettingState {}
final class LogOutSuccessState extends SettingState {
  final String message;

  LogOutSuccessState(this.message);
}
final class LogOutErrorState extends SettingState {
  final String message;

  LogOutErrorState(this.message);
}
