import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //passowrd text field
  bool isResetPasswordsShowing = true;
  IconData suffixIcon = Icons.remove_red_eye_outlined;
  void changeResetPasswordSuffixIcon() {
    isResetPasswordsShowing = !isResetPasswordsShowing;

    // suffixIcon = isLoginPasswordsShowing
    //     ? Icons.remove_red_eye_outlined
    //     : Icons.visibility_off;
    emit(ChangeResetPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmResetPasswordController = TextEditingController();
  bool isConfirmResetPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.remove_red_eye_outlined;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmResetPasswordsShowing = !isConfirmResetPasswordsShowing;
    // suffixIconConfirmPassword =
    //     isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmResetPasswordSuffixIcon());
  }
  //!forgt password 
    TextEditingController emailForgetPasswordController = TextEditingController();
    


}
