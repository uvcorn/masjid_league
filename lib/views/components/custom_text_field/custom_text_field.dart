import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color iconColor;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePassword;
  final double iconSize;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.togglePassword,
    this.iconColor = AppColors.mediumGray,
    this.iconSize = 20,
    required this.keyboardType,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword && obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: iconColor,
                  size: iconSize.r,
                ),
                onPressed: togglePassword,
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.mediumGray,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
