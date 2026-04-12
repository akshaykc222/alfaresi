import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/l10n/local_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleButton extends StatelessWidget {
  const LocaleButton({super.key, this.color = AppColors.black});
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Get the current locale from the provider
    final localeProvider = Provider.of<LocaleProvider>(context, listen: true);
    final currentLocale = localeProvider.locale.languageCode;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap:
          () => _showLanguageSelector(context, currentLocale, localeProvider),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.language,
            color: color,
            size: 18,
            semanticLabel: 'Current language: $currentLocale',
          ),
          const SizedBox(width: 6),
          // Text(
          //   _getLanguageText(currentLocale),
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w500,
          //     color: isDarkMode ? Colors.white : const Color(0xFF131339),
          //   ),
          // ),
          // const SizedBox(width: 2),
          Icon(Icons.arrow_drop_down, color: color, size: 18),
        ],
      ),
    );
  }

  void _showLanguageSelector(
    BuildContext context,
    String currentLocale,
    LocaleProvider localeProvider,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(
            context.l10n.selectLanguage,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption(
                context: context,
                title: context.l10n.englishOption,
                subtitle: 'English',
                value: 'en',
                currentLocale: currentLocale,
                localeProvider: localeProvider,
                flagEmoji: '🇺🇸',
              ),
              const Divider(height: 1),
              _buildLanguageOption(
                context: context,
                title: context.l10n.arabicOption,
                subtitle: 'العربية',
                value: 'ar',
                currentLocale: currentLocale,
                localeProvider: localeProvider,
                flagEmoji: '🇦🇪',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String value,
    required String currentLocale,
    required LocaleProvider localeProvider,
    required String flagEmoji,
  }) {
    final isSelected = value == currentLocale;

    return InkWell(
      onTap: () {
        localeProvider.setLocale(Locale(value));
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColors.primary, size: 24)
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[400]!, width: 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
