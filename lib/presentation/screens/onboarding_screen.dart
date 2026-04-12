import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/presentation/screens/widgets/locale_aware.dart';
import 'package:alfaresi/presentation/screens/widgets/locale_button.dart';
import 'package:alfaresi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ).copyWith(top: 10),
          child: Column(
            children: [
              LocaleAware(child: LocaleButton()),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(AppAssets.appTitle, height: 44),
                  ),
                ),
              ),
              Spacer(),
              Lottie.asset('assets/lottie/onboard_lottie.json'),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFEDEDED),
                ),
                child: Column(
                  children: [
                    Text(
                      context.l10n.welcomeToAlfaresi,
                      style: context.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      context.l10n.discoverInnovativeDigital,
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(102, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        GRouteSoftware().goNamed(context);
                      },
                      child: Text(
                        context.l10n.next,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
