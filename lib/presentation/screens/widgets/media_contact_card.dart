import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaContactCard extends StatelessWidget {
  const MediaContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF0E2848),
      ),
      child: Stack(
        children: [
          Transform.scale(
            scale: 1.4,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/images/png/multi_circle_bg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  context.l10n.weDontJustMakeYouVisible,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.weDontJustMakeYouVisibleDesc,
                  style: context.textTheme.labelMedium!.copyWith(
                    color: const Color(0xFFCDD5Df),
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    const phoneNumber = '+96597804742';
                    final url = Uri.parse(
                      "https://wa.me/${phoneNumber.replaceAll('+', '')}",
                    );

                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 32),
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    context.l10n.contact,
                    style: context.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
