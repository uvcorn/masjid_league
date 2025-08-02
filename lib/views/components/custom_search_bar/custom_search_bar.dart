import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.hasBackground = false,
    this.background = AppColors.lightGray,
    this.fillcolor = AppColors.white,
    this.height = 50,
  });

  final String hintText;
  final Color background;
  final bool hasBackground;
  final Color fillcolor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height!.h,
      decoration: BoxDecoration(
        color: hasBackground ? background : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme.bodySmall?.copyWith(
            color: AppColors.mediumGray,
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.black, size: 24.w),
          filled: true,
          fillColor: fillcolor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
