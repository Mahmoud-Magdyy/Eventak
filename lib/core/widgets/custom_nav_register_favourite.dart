import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/profile/data/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBarFavouriteDetailsScreen extends StatelessWidget {
  const CustomNavBarFavouriteDetailsScreen({
    super.key,
    required this.onPressed,
   required this.favouriteModel,
  });
  final Function() onPressed;
 final FavouriteModel favouriteModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          // width: 400,
          height: 101,
          padding: const EdgeInsets.only(
            top: 19,
            left: 16,
            right: 16,
            bottom: 24,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.grey, width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        color: Color(0xFF495154),
                        fontSize: 16,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: favouriteModel.priceAtTheDoor,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const TextSpan(
                        text: '/total',
                        style: TextStyle(
                          color: Color(0xFF495154),
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ])),
                  ],
                ),
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is AddRegisterErrorState) {
                    showTwist(
                        state: ToastStates.success, messege: state.message);
                  }
                },
                builder: (context, state) {
                  return state is AddRegisterLoadingState
                      ? const Align(
                          alignment: Alignment.centerLeft,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                      : Expanded(
                          child: CustomElevetedButton(
                            text: 'Register',
                            background: const Color(0xFF1561F3),
                            onPressed: state is AddRegisterSuccessState
                                ? () {}
                                : onPressed,
                          ),
                        );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
