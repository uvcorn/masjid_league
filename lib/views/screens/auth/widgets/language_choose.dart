import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_text/custom_text.dart';

class LanguageChoose extends StatelessWidget {
  const LanguageChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: 'AR', fontSize: 14.sp, fontWeight: FontWeight.w400),
        SizedBox(width: 6.w),
        Container(height: 16.h, width: 2.w, color: AppColors.black),
        SizedBox(width: 6.w),
        Container(
          height: 34,
          width: 48,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.secPrimary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: CustomText(
              text: 'EN',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
