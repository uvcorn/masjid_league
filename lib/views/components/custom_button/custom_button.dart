import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool selected;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fillColor = AppColors.secPrimary;
    return SizedBox(
      height: 46.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? fillColor : Colors.white,
          side: BorderSide(color: fillColor, width: 1.2),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : fillColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
