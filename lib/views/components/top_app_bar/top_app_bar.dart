import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../bottom_nav_bar/bottom_nav_controller.dart';
import '../custom_image/custom_image.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              final BottomNavController navController =
                  Get.find<BottomNavController>();
              navController.changeIndex(0);
              Get.offAll(() => const BottomNavBar());
            },
            child: Row(
              children: [
                CustomImage(imageSrc: AppImages.logo, size: 25.r),
                SizedBox(width: 16.w),
                Text(
                  AppStrings.appTitle,
                  style: textTheme.titleMedium?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Get.toNamed(AppRoutes.settingsScreens);
            },
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
