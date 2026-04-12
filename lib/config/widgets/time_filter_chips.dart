import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TimingFilterChips extends StatefulWidget {
  const TimingFilterChips({super.key, required this.time});
  final Function(String selectedTime) time;
  @override
  _TimingFilterChipsState createState() => _TimingFilterChipsState();
}

class _TimingFilterChipsState extends State<TimingFilterChips> {
  @override
  void initState() {
    super.initState();
    selectedTiming = timings[0];
    // Notify parent of default selection after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.time(timings[0]);
    });
  }

  final List<String> timings = [
    "08:30 AM",
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
  ];
  String? selectedTiming;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children:
          timings.map((time) {
            final bool isSelected = selectedTiming == time;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTiming = time;
                });
                widget.time.call(time);
              },
              child: Container(
                height: 32,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.grey200,
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? AppColors.white : AppColors.primaryBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
