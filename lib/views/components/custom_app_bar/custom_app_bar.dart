// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../screens/home_section/widgets/notification_bell_with_badge.dart';
import '../custom_image/custom_image.dart';
import '../custom_search_bar/custom_search_bar.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String hintText;
  final int notificationCount;
  final VoidCallback onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.hintText,
    this.notificationCount = 0,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomImage(imageSrc: AppImages.logo, size: 32.r),
            SizedBox(width: 8.w),
            CustomText(
              text: AppStrings.appTitle,
              fontFamily: AppStrings.oswaldFont,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            NotificationBellWithBadge(
              notificationCount: notificationCount,
              bellColor: AppColors.secPrimary,
              badgeColor: AppColors.red,
              badgeRadius: 4.0.r,
              badgeOffsetDx: 6.0,
              badgeOffsetDy: 5.0,
              onTap: onNotificationTap,
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Container(
          height: 60.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: Offset(4, 1),
                blurRadius: 10.r,
                spreadRadius: -4.r,
              ),
            ],
          ),
          child: CustomSearchBar(hintText: hintText, height: 60.h),
        ),
      ],
    );
  }
}
