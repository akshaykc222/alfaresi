import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headings
  static const TextStyle largeHeading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle mediumHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle smallHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  // Body Texts
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  // Subtitles
  static const TextStyle subtitleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle subtitleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  // Captions & Labels
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const TextStyle label = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  // Buttons
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Light Theme Text Styles
  static TextTheme get lightTextTheme => const TextTheme(
    headlineLarge: largeHeading,
    headlineMedium: mediumHeading,
    headlineSmall: smallHeading,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    titleLarge: subtitleLarge,
    titleMedium: subtitleSmall,
    labelLarge: caption,
    labelMedium: label,
  );

  // Dark Theme Text Styles
  static TextTheme get darkTextTheme => TextTheme(
    headlineLarge: largeHeading.copyWith(color: AppColors.text),
    headlineMedium: mediumHeading.copyWith(color: AppColors.text),
    headlineSmall: smallHeading.copyWith(color: AppColors.text),
    bodyLarge: bodyLarge.copyWith(color: AppColors.text),
    bodyMedium: bodyMedium.copyWith(color: AppColors.text),
    bodySmall: bodySmall.copyWith(color: AppColors.text),
    titleLarge: subtitleLarge.copyWith(color: AppColors.text),
    titleMedium: subtitleSmall.copyWith(color: AppColors.text),
    labelLarge: caption.copyWith(color: AppColors.text),
    labelMedium: label.copyWith(color: AppColors.text),
  );
}
