
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ChangeProfileRegisterImageState extends RegisterState {}
final class ChangeLoginPasswordSuffixIcon extends RegisterState {}
final class ChangeConfirmPasswordSuffixIcon extends RegisterState {}
final class SignUpLoading extends RegisterState {}
final class SignUpSuccess extends RegisterState {
  final String message;


  SignUpSuccess(this.message);}
final class SignUpError extends RegisterState {
  final String message;

  SignUpError(this.message);
}

