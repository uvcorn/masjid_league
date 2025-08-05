// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';

class ToggleYesNoButton extends StatefulWidget {
  const ToggleYesNoButton({super.key});

  @override
  _ToggleYesNoButtonState createState() => _ToggleYesNoButtonState();
}

class _ToggleYesNoButtonState extends State<ToggleYesNoButton> {
  bool _isYesSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Yes Button
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isYesSelected = true;
              });
            },
            child: Container(
              height: 40.h,
              width: 143.w,
              decoration: BoxDecoration(
                color: _isYesSelected ? AppColors.secPrimary : AppColors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: _isYesSelected
                    ? null
                    : Border.all(color: AppColors.secPrimary),
              ),
              child: Center(
                child: CustomText(
                  fontWeight: FontWeight.w500,
                  text: AppStrings.yes,
                  fontSize: 14,
                  color: _isYesSelected
                      ? AppColors.white
                      : AppColors.secPrimary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),

        // No Button
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isYesSelected = false;
              });
            },
            child: Container(
              height: 40.h,
              width: 143.w,
              decoration: BoxDecoration(
                color: _isYesSelected ? AppColors.white : AppColors.secPrimary,
                borderRadius: BorderRadius.circular(6.r),
                border: _isYesSelected
                    ? Border.all(color: AppColors.secPrimary)
                    : null,
              ),
              child: Center(
                child: CustomText(
                  fontWeight: FontWeight.w500,
                  text: AppStrings.no,
                  fontSize: 14,
                  color: _isYesSelected
                      ? AppColors.secPrimary
                      : AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
