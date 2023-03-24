import 'package:flutter/material.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.primaryLightColor,
      primaryColor: AppColors.primaryGreenColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryGreenColor,
        onPrimary: AppColors.lightGrayColor,
        secondary: AppColors.primaryDarkColor,
        onSecondary: AppColors.lightGrayColor,
        error: AppColors.errorColor,
        onError: AppColors.lightGrayColor,
        background: AppColors.primaryLightColor,
        onBackground: AppColors.darkGrayColor,
        surface: AppColors.primaryLightColor,
        onSurface: AppColors.darkGrayColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryLightColor,
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 72,
          fontWeight: FontWeight.w800,
          height: 1.5,
        ),
        titleLarge: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          height: 1.5,
        ),
        titleMedium: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        titleSmall: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        bodyLarge: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 18,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.darkGrayColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          color: AppColors.darkGrayColor.withOpacity(0.5),
          fontSize: 14,
          fontWeight: FontWeight.w300,
          height: 1.2,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.primaryDarkColor,
      primaryColor: AppColors.primaryGreenColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryGreenColor,
        onPrimary: AppColors.lightGrayColor,
        secondary: AppColors.primaryDarkColor,
        onSecondary: AppColors.lightGrayColor,
        error: AppColors.errorColor,
        onError: AppColors.lightGrayColor,
        background: AppColors.primaryDarkColor,
        onBackground: AppColors.lightGrayColor,
        surface: AppColors.primaryDarkColor,
        onSurface: AppColors.lightGrayColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryLightColor,
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 72,
          fontWeight: FontWeight.w800,
          height: 1.5,
        ),
        titleLarge: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          height: 1.5,
        ),
        titleMedium: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        titleSmall: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        bodyLarge: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 18,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          color: AppColors.lightGrayColor.withOpacity(0.5),
          fontSize: 14,
          fontWeight: FontWeight.w300,
          height: 1.2,
        ),
      ),
    );
  }
}
