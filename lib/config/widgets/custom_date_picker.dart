import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final bool showErrorBorder;

  const CustomDatePicker({
    super.key,
    required this.onDateSelected,
    required this.selectedDate,
    this.showErrorBorder = false,
  });

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime date) {
        // Monday (1), Wednesday (3), Thursday (4)
        return date.weekday == DateTime.monday ||
            date.weekday == DateTime.wednesday ||
            date.weekday == DateTime.thursday;
      },
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primary,
            hintColor: Colors.red,
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogTheme: DialogThemeData(backgroundColor: AppColors.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        height: 48,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: showErrorBorder ? Colors.red : AppColors.grey200,
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Image.asset(AppAssets.datePicker, height: 24),
            const SizedBox(width: 16),
            Text(
              selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : "Date",
              style: TextStyle(
                fontSize: 16,
                color:
                    selectedDate == null
                        ? AppColors.grey400
                        : AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Image.asset(AppAssets.arrowDown, height: 9, fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }
}
