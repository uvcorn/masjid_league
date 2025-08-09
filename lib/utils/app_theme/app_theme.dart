import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: _textTheme.apply(),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.secPrimary, width: 1.5.w),
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: GoogleFonts.tiltWarp(
        fontSize: 48.sp,
        color: AppColors.black,
      ),
      headlineMedium: GoogleFonts.tiltWarp(
        fontSize: 24.sp,
        color: AppColors.black,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 20.sp,
        color: AppColors.black,
      ),
      titleLarge: GoogleFonts.tiltWarp(fontSize: 32.sp, color: AppColors.black),
      titleMedium: GoogleFonts.tiltWarp(
        fontSize: 24.sp,
        color: AppColors.black,
      ),
      titleSmall: GoogleFonts.tiltWarp(fontSize: 22.sp, color: AppColors.black),
      bodyLarge: GoogleFonts.roboto(fontSize: 18.sp, color: AppColors.black),
      bodyMedium: GoogleFonts.roboto(fontSize: 16.sp, color: AppColors.black),

      bodySmall: GoogleFonts.roboto(
        fontSize: 14.sp,
        color: AppColors.mediumGray,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 12.sp,
        color: AppColors.mediumGray,
      ),
    );
  }
}
