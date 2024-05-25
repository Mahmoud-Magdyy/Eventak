import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(

      //scaffold theme
      scaffoldBackgroundColor: Colors.white,
      //! appBar theme
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: AppColors.primary,
      // ),
      //! text theme
      // textTheme: TextTheme(
      //   displayLarge: boldStyle(color: AppColors.white),
      //   displayMedium: regularStyle(),
      // ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
            side: const BorderSide(width: 1, color: Colors.transparent),// color: Color(0xFF376091)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: AppColors.primaryColor
            ),
            
      ),
      //text field
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xff7091B9)),
            borderRadius: BorderRadius.circular(12)),
        //enabled border
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xff7091B9)),
            borderRadius: BorderRadius.circular(12)),
        //fouced border
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xff7091B9)),
            borderRadius: BorderRadius.circular(12)),
        //error border
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xff7091B9)),
            borderRadius: BorderRadius.circular(12)),
        //! hint
        // hintStyle: boldStyle(color: AppColors.grey, fontSize: 16),
        // fillColor: AppColors.grey,
        // filled: true
      ),
      textButtonTheme: TextButtonThemeData(

        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          // foregroundColor: MaterialStateProperty.all(Colors.grey),
          textStyle:
              MaterialStatePropertyAll(AppStyles.styleSemiBold16(context)),
        ),
      ),

      // iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(0)))),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.red));
}
