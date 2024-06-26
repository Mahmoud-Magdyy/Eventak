import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

class AppStyles {
  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMediumBlue12(BuildContext context) {
    return TextStyle(
      color: AppColors.colorCategoryName,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium6(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 6),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium10(BuildContext context) {
    return TextStyle(
      color: Colors.black.withOpacity(0.3400000035762787),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMediumBlue10(BuildContext context) {
    return TextStyle(
      color: AppColors.colorCategoryName,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFA2A3A5),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF386192),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium8(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
      height: 1.8
    );
  }
  static TextStyle styleMedium40(BuildContext context) {
    return TextStyle(
      color: AppColors.deepBlue,
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: AppColors.deepBlue,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold10(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      color: Colors.black.withOpacity(0.4399999976158142), //?
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleSemiBoldWhite12(BuildContext context) {
    return TextStyle(
      color: Colors.white, //?
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF1D3F68), //?
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF0B2442), //?
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular6(BuildContext context) {
    return TextStyle(
      color: Colors.black, //?
      fontSize: getResponsiveFontSize(context, fontSize: 6),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF0B2442), //?
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: Colors.black, 
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      color: Colors.black, 
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: Colors.black, 
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: Colors.black, 
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleBold40(BuildContext context) {
    return TextStyle(
      // color: Colors.black, //?
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold36(BuildContext context) {
    return TextStyle(
        color: const Color(0xFF0B2442), //?
        fontSize: getResponsiveFontSize(context, fontSize: 36),
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w700,
        height: 1.058,
        
        
        );
  }

  static TextStyle styleSemiBold6(BuildContext context) {
    return TextStyle(
      // color: Colors.black, //?
      fontSize: getResponsiveFontSize(context, fontSize: 6),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleSemiBold8(BuildContext context) {
    return TextStyle(
      color: AppColors.lightBlue, 
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
