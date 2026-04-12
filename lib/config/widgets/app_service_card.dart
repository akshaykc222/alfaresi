import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AppServiceCardModel {
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  AppServiceCardModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
}

class AppServiceCard extends StatelessWidget {
  const AppServiceCard({super.key, required this.model});
  final AppServiceCardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.image, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(
            model.title,
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            model.subTitle,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: model.onTap,
            child: Text(
              context.l10n.bookNow,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
