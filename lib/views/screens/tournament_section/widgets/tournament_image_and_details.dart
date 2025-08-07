// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_popup_menu_button/custom_popup_menu_button.dart';
import '../../../components/custom_text/custom_text.dart';

class TournamentImageAndDetails extends StatelessWidget {
  const TournamentImageAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
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
                AppStrings.copyTournamentWithTeam,
                AppStrings.copyTournamentWithoutTeam,
                AppStrings.deleteTournament,
              ],
              onChanged: (selectedItem) {
                // handle
              },
              icons: Icons.more_vert,
              iconColor: AppColors.white,
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 12.w,
            right: 12.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppImages.communityLogo, size: 50.r),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
