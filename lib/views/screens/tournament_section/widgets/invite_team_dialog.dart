import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';

class InviteTeamDialog extends StatelessWidget {
  final TextEditingController teamNameController;
  final TextEditingController emailController;
  final VoidCallback onInvite;
  final VoidCallback onCancel;

  const InviteTeamDialog({
    super.key,
    required this.teamNameController,
    required this.emailController,
    required this.onInvite,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            CustomText(
              text: AppStrings.inviteATeam,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 32.h),

            /// Team Name Field
            TextField(
              controller: teamNameController,
              decoration: InputDecoration(
                hintText: AppStrings.teamName,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.mediumGray,
                ),
              ),
            ),
            SizedBox(height: 12.h),

            /// Email Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: AppStrings.email,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.mediumGray,
                ),
              ),
            ),
            SizedBox(height: 24.h),

            /// Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 80.w,
                  child: TextButton(
                    onPressed: onCancel,
                    child: CustomText(
                      text: AppStrings.cancel,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  height: 40.h,
                  width: 80.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    onPressed: onInvite,
                    child: CustomText(
                      text: AppStrings.invite,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
