// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';

// A more flexible class to hold either an icon or an image path
class DrawerMenuItem {
  final IconData? icon;
  final String? imagePath;
  final String label;

  DrawerMenuItem({this.icon, this.imagePath, required this.label})
    : assert(
        icon != null || imagePath != null,
      ); // Ensure either an icon or image is provided
}

class CustomDrawer extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final List<DrawerMenuItem> items;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  // Helper method to render the icon or image
  Widget _buildIconOrImage(DrawerMenuItem item, bool isSelected) {
    Color color = isSelected ? AppColors.primary : AppColors.mediumGray;
    double size = 28.r;

    if (item.icon != null) {
      return Icon(item.icon, size: size, color: color);
    } else if (item.imagePath != null) {
      // You can handle different image types here (SVG, PNG, etc.)
      if (item.imagePath!.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          item.imagePath!,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      } else {
        // For PNG or other image types
        return CustomImage(imageSrc: item.imagePath!, size: size);
      }
    }
    return SizedBox(width: size, height: size); // Fallback to an empty box
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                /// 🔙 Back Button
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20.r,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Back",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                /// 📛 Title
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                Divider(color: AppColors.primary, thickness: 1, height: 16.h),

                /// 📜 Drawer Items (icon/image on top, label below)
                ...List.generate(items.length, (index) {
                  final item = items[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => onItemSelected(index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildIconOrImage(item, isSelected),
                          SizedBox(height: 6.h),
                          CustomText(
                            text: item.label,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.mediumGray,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
