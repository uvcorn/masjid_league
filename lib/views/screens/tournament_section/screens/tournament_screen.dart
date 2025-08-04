// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_popup_menu_button/custom_popup_menu_button.dart';
import '../../../components/custom_text/custom_text.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              CustomAppBar(
                hintText: AppStrings.searchCommunity,
                notificationCount: 5,
                onNotificationTap: () {
                  // Handle tap
                },
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: AppStrings.myTournament,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.oswaldFont,
                fontSize: 20.sp,
              ),
              SizedBox(height: 12.h),

              // Tournament Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 4.r,
                      offset: Offset(0.r, 3.r),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Image with overlay
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.r),
                          ),
                          child: Stack(
                            children: [
                              CustomNetworkImage(
                                imageUrl: AppConstants.footballLandscape,
                                height: 190.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 190.h,
                                width: double.infinity,
                                color: AppColors.secPrimary.withOpacity(0.5),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: CustomPopupMenuButton(
                                  items: [
                                    'Copy Tournament (with Team)',
                                    'Copy Tournament (without Team)',
                                    'Delete Tournament',
                                  ],
                                  onChanged: (selectedItem) {
                                    // handle
                                  },
                                  icons: Icons.more_vert,
                                  iconColor: AppColors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 12,
                                left: 12,
                                right: 12,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImage(
                                      imageSrc: AppImages.communityLogo,
                                      size: 50.r,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: AppStrings.tournamentName,
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            text: AppStrings.tournamentDate,
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          SizedBox(height: 4.h),
                                          CustomText(
                                            text: AppStrings.byHost,
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: CustomText(
                          textAlign: TextAlign.left,
                          text: AppStrings.detailDate,
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              GestureDetector(
                onTap: () {
                  // Get.toNamed(AppRoutes.registerCommunityScreen);
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secPrimary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.createANewTournament,
                      color: AppColors.secPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
