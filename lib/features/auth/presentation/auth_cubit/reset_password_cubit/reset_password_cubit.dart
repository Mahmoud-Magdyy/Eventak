import 'package:eventak/features/auth/data/models/send_code_model.dart';
import 'package:eventak/features/auth/data/reposatiry/auth_repository.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authrepo) : super(ResetPasswordInitial());
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AuthRepository authrepo;
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
  TextEditingController confirmResetPasswordController =
      TextEditingController();
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

  SendCodeModel? sendCodeModel;
  // login method
  void sendCode() async {
    emit(SendCodeLoadingState());
    final result = await authrepo.sendCode(
      email: emailForgetPasswordController.text,
    );
    result.fold((l) => emit(SendCodeErrorState(l)), (r) async {
      sendCodeModel = r;
      emit(SendCodeSuccessState(r.message));
    });
  }
}
