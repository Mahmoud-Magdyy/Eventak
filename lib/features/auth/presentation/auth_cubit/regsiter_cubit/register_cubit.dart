import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.remove_red_eye_outlined;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;

    // suffixIcon = isLoginPasswordsShowing
    //     ? Icons.remove_red_eye_outlined
    //     : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }
}
