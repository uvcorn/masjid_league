import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  final Color iconColor;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.togglePassword,
    this.iconColor = AppColors.mediumGray,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword && obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: iconColor,
                ),
                onPressed: togglePassword,
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
