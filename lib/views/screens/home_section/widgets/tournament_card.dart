import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_popup_menu_button/custom_popup_menu_button.dart';
import '../../../components/custom_text/custom_text.dart';

class TournamentCard extends StatelessWidget {
  final bool isOwnedTeam;
  const TournamentCard({super.key, this.isOwnedTeam = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    children: [
                      CustomImage(
                        imageSrc: AppImages.communityLogo,
                        size: 32.r,
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppStrings.alaminMasjid,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: AppStrings.community,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                isOwnedTeam
                    ? Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: AppColors.primaryOrange,
                            size: 16.r,
                          ),
                        ),
                      )
                    : CustomPopupMenuButton(
                        items: [
                          'Copy Tournament (with Team)',
                          'Copy Tournament (without Team)',
                          'Delete Tournament',
                        ],
                        onChanged: (selectedItem) {
                          // handle
                        },
                        icons: Icons.more_vert,
                        iconColor: AppColors.secPrimary,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
