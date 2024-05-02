import 'package:eventak/features/auth/data/models/register_model.dart';
import 'package:eventak/features/auth/data/reposatiry/auth_repository.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authrepo) : super(RegisterInitial());
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //passowrd text field
  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.remove_red_eye_outlined;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;

    // suffixIcon = isLoginPasswordsShowing
    //     ? Icons.remove_red_eye_outlined
    //     : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.remove_red_eye_outlined;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    // suffixIconConfirmPassword =
    //     isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  //! register method
  final AuthRepository authrepo;

  RegisterModel? registerModel;
  // register
  void signUp() async {
    emit(SignUpLoading());
    final result = await authrepo.signUp(
      confirmPassword:confirmPasswordController.text ,
      userName:userNameController.text ,
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((l) => emit(SignUpError(l)), (r) async {
      registerModel = r;
      emit(SignUpSuccess());
    });
  }
}
