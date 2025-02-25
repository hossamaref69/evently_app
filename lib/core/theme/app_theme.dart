import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.purpleColor,
    dividerColor: AppColors.purpleColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.purpleColor,
        textStyle: const TextStyle(
            color: AppColors.purpleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),
        padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
    ),
    colorScheme: const ColorScheme.light(primary: AppColors.purpleColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: AppColors.blackColor, fontSize: 12, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
          color: AppColors.purpleColor, fontSize: 22, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          color: AppColors.purpleColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          color: AppColors.purpleColor, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.purpleColor,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.purpleColor,
    scaffoldBackgroundColor: AppColors.darkPurple,
    colorScheme: const ColorScheme.light(primary: AppColors.purpleColor),    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.purpleColor,
        padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        textStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.whiteColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: AppColors.whiteColor, fontSize: 12, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
          color: AppColors.whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          color: AppColors.purpleColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          color: AppColors.purpleColor, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}