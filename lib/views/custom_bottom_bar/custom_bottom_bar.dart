// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../components/custom_text/custom_text.dart';

class BottomBarButton {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  BottomBarButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isPrimary = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });
}

class CustomBottomBar extends StatelessWidget {
  final BottomBarButton leftButton;
  final BottomBarButton rightButton;
  final double buttonHight;
  final double buttonWidth;
  const CustomBottomBar({
    super.key,
    required this.leftButton,
    required this.rightButton,
    this.buttonHight = 48,
    this.buttonWidth = 150,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildButton(BottomBarButton button) {
      final Color bgColor =
          button.backgroundColor ??
          (button.isPrimary ? AppColors.primary : Colors.transparent);

      final Color txtColor =
          button.textColor ??
          (button.isPrimary ? AppColors.white : AppColors.secPrimary);

      final Color border =
          button.borderColor ??
          (button.isPrimary ? Colors.transparent : AppColors.primary);

      final child = button.icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(button.icon, size: 18.sp, color: txtColor),
                SizedBox(width: 6.w),
                CustomText(
                  text: button.label,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ],
            )
          : CustomText(
              text: button.label,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: txtColor,
            );

      return SizedBox(
        width: buttonWidth.w,
        height: buttonHight.h,
        child: button.isPrimary
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: txtColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: button.onPressed,
                child: child,
              )
            : OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: border, width: 2),
                  foregroundColor: txtColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: button.onPressed,
                child: child,
              ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildButton(leftButton), buildButton(rightButton)],
        ),
      ),
    );
  }
}
