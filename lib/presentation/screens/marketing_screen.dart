import 'dart:io';
import 'package:alfaresi/presentation/screens/widgets/locale_button.dart';
import 'package:alfaresi/presentation/screens/widgets/localize_number.dart';
import 'package:flutter/material.dart';
import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/presentation/screens/widgets/media_contact_card.dart';

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final topPadding = Platform.isAndroid ? 25.0 : 20.0;

    return Scaffold(
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 271,
              width: screenWidth / 2,
              decoration: BoxDecoration(
                color: const Color(0Xff717171).withAlpha(12),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: 0,
            child: Image.asset(
              AppAssets.marketingBgEllipsis,
              height: 256,
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, topPadding, 20, 20),
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSection(),
                    SizedBox(height: 24),
                    WhyLaunchSection(),
                    SizedBox(height: 24),
                    SuperchargeSection(),
                    SizedBox(height: 16),
                    ServiceFeaturesSection(),
                    SizedBox(height: 24),
                    SmallStartSection(),
                    SizedBox(height: 24),
                    MediaContactCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.topRight, child: LocaleButton());
  }
}

class WhyLaunchSection extends StatelessWidget {
  const WhyLaunchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MediaImage(
          imageUrl: 'assets/images/png/media_1.png',
          heroTag: 'media_1',
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(context.l10n.whyLaunchWithAlfaresi),
              const SizedBox(height: 8),
              SectionDescription(
                context.l10n.whyLaunchWithAlfaresiDesc,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SuperchargeSection extends StatelessWidget {
  const SuperchargeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(context.l10n.howDoWeSupercharge),
              const SizedBox(height: 8),
              SectionDescription(context.l10n.howDoWeSuperchargeDesc),
              const SizedBox(height: 22),
              MarketingFeature(
                number: '1',
                title: context.l10n.howDoWeSuperchargeFirstTitle,
                subtitle: context.l10n.howDoWeSuperchargeFirstDesc,
              ),
              const SizedBox(height: 16),
              MarketingFeature(
                number: '2',
                title: context.l10n.howDoWeSuperchargeSecondTitle,
                subtitle: context.l10n.howDoWeSuperchargeSecondDesc,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const MediaImage(
          imageUrl: 'assets/images/png/media_2.png',
          heroTag: 'media_2',
        ),
      ],
    );
  }
}

class ServiceFeaturesSection extends StatelessWidget {
  const ServiceFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildFeatureCard(
            context,
            number: '3',
            title: context.l10n.howDoWeSuperchargeThirdTitle,
            subtitle: context.l10n.howDoWeSuperchargeThirdDesc,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFeatureCard(
            context,
            number: '4',
            title: context.l10n.howDoWeSuperchargeFourth,
            subtitle: context.l10n.howDoWeSuperchargeFourthDesc,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MarketingFeature(
        number: number,
        title: title,
        subtitle: subtitle,
        backgroundColor: AppColors.grey200.withOpacity(0.3),
      ),
    );
  }
}

class SmallStartSection extends StatelessWidget {
  const SmallStartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MediaImage(
          imageUrl: 'assets/images/png/media_3.png',
          heroTag: 'media_3',
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(context.l10n.smartStart),
              const SizedBox(height: 8),
              SectionDescription(context.l10n.smartStartDesc),
              const SizedBox(height: 16),
              MarketingFeature(
                number: '1',
                title: context.l10n.smartStartFirst,
              ),
              const SizedBox(height: 12),
              MarketingFeature(
                number: '2',
                title: context.l10n.smartStartFirstSecond,
              ),
              const SizedBox(height: 12),
              MarketingFeature(
                number: '3',
                title: context.l10n.smartStartThird,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// === Reusable Components ===

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleLarge!.copyWith(
        color: AppColors.primaryBlue,
        fontWeight: FontWeight.w700,
        fontSize: 19,
      ),
    );
  }
}

class SectionDescription extends StatelessWidget {
  final String text;
  final Color? color;

  const SectionDescription(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.labelLarge!.copyWith(
        color: color ?? AppColors.neutral500,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class MediaImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const MediaImage({super.key, required this.imageUrl, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imageUrl,
          height: 254,
          width: 126,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MarketingFeature extends StatelessWidget {
  const MarketingFeature({
    super.key,
    required this.number,
    required this.title,
    this.subtitle = '',
    this.backgroundColor,
  });

  final String number, title, subtitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FeatureNumber(number),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: context.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral500,
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class FeatureNumber extends StatelessWidget {
  final String number;

  const FeatureNumber(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    final localizedNumber = localizeNumber(context, number);
    return Text(
      localizedNumber,
      style: context.textTheme.bodyLarge!.copyWith(
        color: AppColors.textBlue,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
