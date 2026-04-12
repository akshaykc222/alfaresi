import 'package:flutter/material.dart';

String localizeNumber(BuildContext context, String number) {
  final isArabic = Localizations.localeOf(context).languageCode == 'ar';
  if (!isArabic) return number;

  final arabicNumbers = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  return number.split('').map((digit) => arabicNumbers[digit] ?? digit).join();
}
