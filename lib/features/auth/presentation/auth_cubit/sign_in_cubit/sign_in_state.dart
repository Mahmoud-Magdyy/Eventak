
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class ChangeLoginPasswordSuffixIcon extends SignInState {}
final class LoginLoadingState extends SignInState {}
final class LoginOpeningState extends SignInState {}
final class LoginSuccessState extends SignInState {
  final String message;

  LoginSuccessState(this.message);
}
final class LoginErrorState extends SignInState {
  final String message;

  LoginErrorState(this.message);
}
