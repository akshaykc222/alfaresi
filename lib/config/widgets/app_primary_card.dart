import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppPrimaryCard extends StatelessWidget {
  const AppPrimaryCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            AppColors.primary.withOpacity(0.9),
            AppColors.primary.withOpacity(0.95),
            AppColors.primary.withOpacity(1),
          ],
          stops: [0.2, 0.6, 1.0],
        ),
        image: DecorationImage(
          image: AssetImage(AppAssets.appCardbgS),
          alignment: Alignment.centerRight,
          fit: BoxFit.contain,
        ),
      ),
      child: child,
    );
  }
}
