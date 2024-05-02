
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ChangeResetPasswordSuffixIcon extends ResetPasswordState {}
final class ChangeConfirmResetPasswordSuffixIcon extends ResetPasswordState {}
final class SendCodeLoadingState extends ResetPasswordState {}
final class SendCodeErrorState extends ResetPasswordState {
  final String message;

  SendCodeErrorState(this.message);
}
final class SendCodeSuccessState extends ResetPasswordState {
  final String message;

  SendCodeSuccessState(this.message);
}
final class ResetPasswordCodeLoadingState extends ResetPasswordState {}
final class ResetPasswordCodeErrorState extends ResetPasswordState {
  final String message;

  ResetPasswordCodeErrorState(this.message);
}
final class ResetPasswordCodeSuccessState extends ResetPasswordState {
  final String message;

  ResetPasswordCodeSuccessState(this.message);
}
