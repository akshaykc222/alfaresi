import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppDropdownWidget extends StatefulWidget {
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const AppDropdownWidget({
    super.key,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  State<AppDropdownWidget> createState() => _AppDropdownWidgetState();
}

class _AppDropdownWidgetState extends State<AppDropdownWidget> {
  late String selectedValue;
  @override
  void initState() {
    selectedValue = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          menuWidth: 200,
          borderRadius: BorderRadius.circular(8),
          dropdownColor: AppColors.backgroundPrimary,
          value: selectedValue,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
            widget.onChanged;
          },

          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          items:
              widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: context.textTheme.bodyMedium),
                );
              }).toList(),
        ),
      ),
    );
  }
}
