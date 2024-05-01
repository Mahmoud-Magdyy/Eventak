
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class LoginLoadingState extends SignInState {}
final class LoginSuccessState extends SignInState {}
final class LoginErrorState extends SignInState {
  final String message;

  LoginErrorState(this.message);
}
