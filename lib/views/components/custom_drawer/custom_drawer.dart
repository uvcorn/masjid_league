// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../screens/tournament_section/widgets/drawer_controller.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';

// A class to hold either an icon or an image path
class DrawerMenuItem {
  final IconData? icon;
  final String? imagePath;
  final String label;

  DrawerMenuItem({this.icon, this.imagePath, required this.label})
    : assert(icon != null || imagePath != null);
}

class CustomDrawer extends StatelessWidget {
  final String title;
  final Function(int) onItemSelected;

  CustomDrawer({super.key, required this.title, required this.onItemSelected});

  final DrawerControllerX drawerController = Get.find();

  final List<DrawerMenuItem> items = [
    DrawerMenuItem(icon: Icons.settings, label: AppStrings.general),
    DrawerMenuItem(icon: Icons.groups, label: AppStrings.participants),
    DrawerMenuItem(imagePath: AppIcons.formate, label: AppStrings.format),
    DrawerMenuItem(icon: Icons.calendar_month, label: AppStrings.schedule),
    DrawerMenuItem(icon: Icons.emoji_events, label: AppStrings.results),
  ];

  // Helper method to render the icon or image
  Widget _buildIconOrImage(DrawerMenuItem item, bool isSelected) {
    Color color = isSelected ? AppColors.primary : AppColors.mediumGray;
    double size = 28.r;

    if (item.icon != null) {
      return Icon(item.icon, size: size, color: color);
    } else if (item.imagePath != null) {
      if (item.imagePath!.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          item.imagePath!,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      } else {
        return CustomImage(imageSrc: item.imagePath!, size: size);
      }
    }
    return SizedBox(width: size, height: size);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Drawer(
        backgroundColor: AppColors.white,
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

                /// 📜 Drawer Items
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      // This is the correct way to get the selected index
                      final isSelected =
                          drawerController.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () {
                          drawerController.updateIndex(index);
                          onItemSelected(index);
                        },
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
