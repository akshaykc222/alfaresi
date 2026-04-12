import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, required this.child, this.border = 0});
  final Widget child;
  final double border;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: border, color: AppColors.grey200),
      ),
      child: child,
    );
  }
}
