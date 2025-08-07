import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_date_picker/custom_date_picker.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/day_item_card/day_item_card.dart';

class MultiDaySelector extends StatefulWidget {
  const MultiDaySelector({super.key});

  @override
  State<MultiDaySelector> createState() => _MultiDaySelectorState();
}

class _MultiDaySelectorState extends State<MultiDaySelector> {
  List<DateTime> selectedDates = [DateTime.now()];

  void _pickDate(int index) async {
    await showCustomDatePicker(
      context: context,
      initialDate: selectedDates[index],
      onDateSelected: (picked) {
        setState(() {
          selectedDates[index] = picked;
        });
      },
    );
  }

  void _addDay() async {
    DateTime initial = DateTime.now();

    await showCustomDatePicker(
      context: context,
      initialDate: initial,
      onDateSelected: (picked) {
        setState(() {
          selectedDates.add(picked);
        });
      },
    );
  }

  void _deleteDay(int index) {
    if (selectedDates.length > 1) {
      setState(() {
        selectedDates.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🗓️ List of DayItemCards
        ...List.generate(selectedDates.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: DayItemCard(
              index: index,
              date: selectedDates[index],
              onEdit: () => _pickDate(index),
              onDelete: selectedDates.length > 1
                  ? () => _deleteDay(index)
                  : null,
            ),
          );
        }),

        ///   Add Day Button
        GestureDetector(
          onTap: _addDay,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.mediumGray),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: CustomText(
                text: AppStrings.addDay,
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
