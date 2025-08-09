import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';

class CustomScreenHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;
  final Color backIconColor;
  final Color titleColor;
  final Color? rightIconColor;

  const CustomScreenHeader({
    super.key,
    required this.title,
    this.onBackTap,
    this.rightIcon,
    this.onRightIconTap,
    this.backIconColor = AppColors.black,
    this.titleColor = AppColors.black,
    this.rightIconColor = AppColors.secPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Back Button
        GestureDetector(
          onTap: onBackTap ?? () => Get.back(),
          child: Icon(Icons.arrow_back, color: backIconColor),
        ),

        SizedBox(width: 16.w),

        /// Title
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        /// Optional Right Icon (e.g., Menu)
        if (rightIcon != null)
          GestureDetector(
            onTap: onRightIconTap,
            child: Icon(rightIcon, color: rightIconColor ?? backIconColor),
          ),
      ],
    );
  }
}
