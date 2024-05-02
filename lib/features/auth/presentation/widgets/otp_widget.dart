import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordCodeSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar( SnackBar(content: Text(state.message)));
          // customReplacementNavigate(context, '/SignIn');
          Navigator.pop(context);
        } else if (state is ResetPasswordCodeErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar( SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return State is ResetPasswordCodeLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : OtpTextField(
                numberOfFields: 5,
                cursorColor: AppColors.lightBlue,
                showCursor: false,
                // enabledBorderColor: Colors.black,
                enabledBorderColor: AppColors.lightBlue,
                focusedBorderColor: AppColors.primaryColor,
                borderColor: AppColors.deepBlue,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                
                textStyle: AppStyles.styleMedium40(context)
                    .copyWith(fontWeight: FontWeight.w600),
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                  // context.read<ResetPasswordCubit>().resetPasswrd(code);
                },

                //runs when every textfield is filled
                // onSubmit: (String verificationCode){
                //     showDialog(
                //         context: context,
                //         builder: (context){
                //         return AlertDialog(
                //             title: const Text("Verification Code"),
                //             content: Text('Code entered is $verificationCode'),
                //         );
                //         }
                //     );
                // },
                // end onSubmit
              );
      },
    );
  }
}
