import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onHomePressed;

  const SuccessDialog({required this.onHomePressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.greenish,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(16.w),
              child: const Icon(Icons.check, size: 40, color: Colors.white),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: AppStrings.promotionSuccessful,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: AppStrings.paymentMessage,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGray,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: onHomePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: CustomText(
                  text: AppStrings.home,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
