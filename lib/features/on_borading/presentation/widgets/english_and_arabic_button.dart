import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/bloc/cubit/global_state.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EnglishAndArabicButton extends StatelessWidget {
  const EnglishAndArabicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Container(
          width: 54,
          height: 30,
          padding: const EdgeInsets.all(4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.80, color: AppColors.deepBlue),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<GlobalCubit>(context)
                                    .changeLang('en');
                },
                child: SvgPicture.asset(Assets.imagesEn),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<GlobalCubit>(context)
                                    .changeLang('ar');
                },
                child: SvgPicture.asset(Assets.imagesArabic),
              ),
            ],
          ),
        );
      },
    );
  }
}
