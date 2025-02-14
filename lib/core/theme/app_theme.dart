import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.purpleColor,
        padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        textStyle: const TextStyle(fontSize: 16, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColors.purpleColor,
        fontWeight: FontWeight.w400,
        fontSize: 16
      ),
      iconTheme: IconThemeData(
        color: AppColors.purpleColor
      )
    )
  );
}