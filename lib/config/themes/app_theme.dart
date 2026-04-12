import 'package:flutter/material.dart';
import 'package:alfaresi/config/themes/app_text_styles.dart' show AppTextStyles;
import 'app_colors.dart';

class ThemeConfig {
  static ThemeData light(Locale locale) => ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.accent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: _getFontFamily(locale),
    textTheme: AppTextStyles.lightTextTheme,
    elevatedButtonTheme: _elevatedButtonTheme(AppColors.primary),
    inputDecorationTheme: _inputDecorationTheme(Colors.white),
  );

  static String _getFontFamily(Locale locale) {
    if (locale.languageCode == 'ar') {
      return 'AppArabicFont';
    } else {
      return 'AppEnglishFont';
    }
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(Color backgroundColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(Color fillColor) {
    return InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.all(16.0),
    );
  }
}
