
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
