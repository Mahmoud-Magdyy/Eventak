
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
final class DeleteAccountLoadingState extends SettingState {}
final class DeleteAccountSuccessState extends SettingState {
  final String message;

  DeleteAccountSuccessState(this.message);
}
final class DeleteAccountErrorState extends SettingState {
  final String message;

  DeleteAccountErrorState(this.message);
}
