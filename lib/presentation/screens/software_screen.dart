import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/config/widgets/app_container.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/l10n/local_provider.dart';
import 'package:alfaresi/presentation/screens/marketing_screen.dart';
import 'package:alfaresi/presentation/screens/widgets/locale_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SoftwareScreen extends StatelessWidget {
  const SoftwareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: AppColors.background,
            height: height * 0.72,
            child: Stack(
              children: [
                _HeaderSection(height: height * 0.5, l10n: l10n),
                _ForegroundImage(height: height * 0.44),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _CardSec(
                  isCompName: true,
                  title: l10n.companyName,
                  subTitle: l10n.aboutDescription,
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(3, (index) {
                        final img = [
                          AppAssets.technologyLottie,
                          AppAssets.qualityLottie,
                          AppAssets.partnershipLottie,
                        ];
                        final text = [
                          l10n.technology,
                          l10n.quality,
                          l10n.partnership,
                        ];
                        return Container(
                          height: 64,
                          width: 64,
                          decoration: const BoxDecoration(
                            color: Color(0XFFF5F5F5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(img[index], height: 20),
                                const SizedBox(height: 4),
                                Text(
                                  text[index],
                                  style: context.textTheme.bodySmall!.copyWith(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                _CardSec(
                  title: l10n.visionTitle,
                  subTitle: l10n.visionDescription,
                ),
                const SizedBox(height: 24),

                _CardSec(
                  title: l10n.missionTitle,
                  subTitle: l10n.missionDescription,
                ),
                const SizedBox(height: 24),
                AppContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.servicesTitle,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _text(
                                  number: '1',
                                  title: l10n.service1Title,
                                  subtitle: l10n.service1Description,
                                  context: context,
                                ),
                                const SizedBox(height: 8),
                                _text(
                                  number: '2',
                                  title: l10n.service2Title,
                                  subtitle: l10n.service2Description,
                                  context: context,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/png/media_2.png',
                              height: 220,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      _text(
                        number: '3',
                        title: l10n.service3Title,
                        subtitle: l10n.service3Desc,
                        context: context,
                      ),
                      const SizedBox(height: 16),

                      // Row with service 4 and 5
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _text(
                              number: '4',
                              title: l10n.service4Title,
                              subtitle: l10n.service4Description,
                              context: context,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _text(
                              number: '5',
                              title: l10n.service5Title,
                              subtitle: l10n.service5Description,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const _AboutCard(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _text({
    required String number,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureNumber(number.toString()),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _sectionText(context, subtitle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.bodySmall!.copyWith(
        fontSize: 12,
        color: AppColors.neutral90,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),

      // textAlign: isArabic ? TextAlign.end : TextAlign.justify,
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final double height;
  final dynamic l10n;

  const _HeaderSection({required this.height, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      l10n.software,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const LocaleButton(color: AppColors.white),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        l10n.welcomeHeading,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.welcomeSubheading,
                        style: context.textTheme.labelLarge!.copyWith(
                          color: AppColors.greyC7,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
              AppAssets.softwareBg,
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class _ForegroundImage extends StatelessWidget {
  final double height;

  const _ForegroundImage({required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        'assets/images/png/software_mobile.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _CardSec extends StatelessWidget {
  const _CardSec({
    required this.title,
    required this.subTitle,
    this.isCompName = false,
    this.footer,
  });
  final String title;
  final String subTitle;
  final bool isCompName;
  final Widget? footer;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      border: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isCompName == true
              ? Text(
                context.l10n.aboutAlfaresi,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
              : const SizedBox(),
          const SizedBox(height: 12),
          _sectionTitle(context, title),
          const SizedBox(height: 16),
          _sectionText(context, subTitle),
          const SizedBox(height: 12),
          if (footer != null) footer!,
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _sectionText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.bodySmall!.copyWith(
        fontSize: 12,
        color: AppColors.neutral90,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),

      // textAlign: isArabic ? TextAlign.end : TextAlign.justify,
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard();

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
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    context.l10n.whyAlFaresiTitle,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    context.l10n.whyAlFaresiDesc,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: const Color(0xFFCDD5Df),
                      fontSize: 12,
                      letterSpacing:
                          context.read<LocaleProvider>().locale ==
                                  const Locale('en')
                              ? 0
                              : 01,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
