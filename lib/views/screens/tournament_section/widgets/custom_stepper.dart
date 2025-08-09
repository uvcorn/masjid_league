// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_text/custom_text.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<String> labels;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212.w,
      child: Column(
        children: [
          SizedBox(
            height: 24.r,
            child: Stack(
              children: [
                Positioned(
                  left: 12.w,
                  right: 12.w,
                  top: 11.r,
                  child: Container(
                    height: 2.h,
                    color: AppColors.mediumGray.withOpacity(0.5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(labels.length, (index) {
                    bool isCompleted = index < currentStep;
                    bool isActive = index == currentStep;
                    Color stepColor = isCompleted || isActive
                        ? AppColors.greenish
                        : AppColors.greenish;

                    return Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: stepColor,
                        border: Border.all(color: stepColor, width: 2.r),
                      ),
                      child: isCompleted
                          ? Icon(Icons.check, size: 20.r, color: Colors.white)
                          : null,
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(labels.length, (index) {
              return CustomText(
                text: labels[index],
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              );
            }),
          ),
        ],
      ),
    );
  }
}
