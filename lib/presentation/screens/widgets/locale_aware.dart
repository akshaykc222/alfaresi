import 'package:flutter/material.dart';

class LocaleAware extends StatelessWidget {
  const LocaleAware({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';

    return Align(
      alignment: isArabic ? Alignment.topLeft : Alignment.topRight,
      child: child,
    );
  }
}
