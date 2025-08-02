import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojid/views/screens/home/widgets/image_slider.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_search_bar/custom_search_bar.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/notification_bell_with_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Row(
                  children: [
                    CustomImage(imageSrc: AppImages.logo, size: 32.r),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: AppStrings.appTitle,
                      fontFamily: AppStrings.oswaldFont,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    NotificationBellWithBadge(
                      notificationCount: 5,
                      bellColor: AppColors.secPrimary,
                      badgeColor: AppColors.red,
                      badgeRadius: 5.0,
                      badgeOffsetDx: 4.0,
                      badgeOffsetDy: 8.0,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: AppColors.black),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.16),
                        offset: Offset(0, 2),
                        blurRadius: 10,
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  child: CustomSearchBar(
                    hintText: 'Search community',
                    height: 60.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.prayerTime,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.oswaldFont,
                    ),
                    SizedBox(width: 40.w),
                    CustomText(
                      text: AppStrings.prayerTime1,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: AppStrings.aSR,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secPrimary,
                    ),
                    SizedBox(width: 24.w),
                    CustomText(
                      text: AppStrings.prayerTime2,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: AppStrings.mAGH,
                      color: AppColors.secPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: AppStrings.featured,
                  fontFamily: AppStrings.oswaldFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                ImageSlider(),
                SizedBox(height: 20.h),
                CustomText(
                  text: AppStrings.myCommunity,
                  fontFamily: AppStrings.oswaldFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secPrimary),
                  ),
                  child: Center(
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.registerYouCommunity,
                      color: AppColors.secPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 92,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 24.w),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImage(imageSrc: AppImages.communityLogo),
                              SizedBox(width: 24.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.center,
                                    text: AppStrings.alaminMasjid,
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.center,
                                    text: AppStrings.community,
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(width: 24.w),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_vert,
                                  color: AppColors.secPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
